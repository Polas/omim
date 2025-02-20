#include "map/track.hpp"

#include "map/bookmark_helpers.hpp"
#include "map/user_mark_id_storage.hpp"

#include "geometry/distance_on_sphere.hpp"
#include "geometry/mercator.hpp"

#include <utility>

Track::Track(kml::TrackData && data)
  : Base(data.m_id == kml::kInvalidTrackId ? UserMarkIdStorage::Instance().GetNextTrackId() : data.m_id)
  , m_data(std::move(data))
  , m_groupID(0)
{
  m_data.m_id = GetId();
  ASSERT_GREATER(m_data.m_pointsWithAltitudes.size(), 1, ());
}

std::string Track::GetName() const
{
  return GetPreferredBookmarkStr(m_data.m_name);
}

m2::RectD Track::GetLimitRect() const
{
  m2::RectD rect;
  for (auto const & point : m_data.m_pointsWithAltitudes)
    rect.Add(point.GetPoint());
  return rect;
}

double Track::GetLengthMeters() const
{
  double res = 0.0;

  auto it = m_data.m_pointsWithAltitudes.begin();
  double lat1 = mercator::YToLat(it->GetPoint().y);
  double lon1 = mercator::XToLon(it->GetPoint().x);
  for (++it; it != m_data.m_pointsWithAltitudes.end(); ++it)
  {
    double const lat2 = mercator::YToLat(it->GetPoint().y);
    double const lon2 = mercator::XToLon(it->GetPoint().x);
    res += ms::DistanceOnEarth(lat1, lon1, lat2, lon2);
    lat1 = lat2;
    lon1 = lon2;
  }

  return res;
}

df::DepthLayer Track::GetDepthLayer() const
{
  return df::DepthLayer::UserLineLayer;
}

size_t Track::GetLayerCount() const
{
  return m_data.m_layers.size();
}

dp::Color Track::GetColor(size_t layerIndex) const
{
  CHECK_LESS(layerIndex, m_data.m_layers.size(), ());
  return dp::Color(m_data.m_layers[layerIndex].m_color.m_rgba);
}

float Track::GetWidth(size_t layerIndex) const
{
  CHECK_LESS(layerIndex, m_data.m_layers.size(), ());
  return static_cast<float>(m_data.m_layers[layerIndex].m_lineWidth);
}

float Track::GetDepth(size_t layerIndex) const
{
  return layerIndex * 10;
}

std::vector<m2::PointD> Track::GetPoints() const
{
  std::vector<m2::PointD> result;
  result.reserve(m_data.m_pointsWithAltitudes.size());
  for (auto const & pt : m_data.m_pointsWithAltitudes)
    result.push_back(pt.GetPoint());

  return result;
}

std::vector<geometry::PointWithAltitude> const & Track::GetPointsWithAltitudes() const
{
  return m_data.m_pointsWithAltitudes;
}

void Track::Attach(kml::MarkGroupId groupId)
{
  ASSERT(!m_groupID, ());
  m_groupID = groupId;
}

void Track::Detach()
{
  m_groupID = 0;
}
