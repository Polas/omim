#pragma once

#include "drape_frontend/custom_features_context.hpp"
#include "drape_frontend/map_shape.hpp"
#include "drape_frontend/tile_utils.hpp"
#include "drape_frontend/threads_commutator.hpp"
#include "drape_frontend/traffic_generator.hpp"

#include "drape/constants.hpp"
#include "drape/pointers.hpp"

#include <functional>

namespace dp
{
class TextureManager;
}  // namespace dp

namespace df
{
class Message;
class MetalineManager;

class EngineContext
{
public:
  using TIsUGCFn = std::function<bool (FeatureID const &)>;
  EngineContext(TileKey tileKey,
                ref_ptr<ThreadsCommutator> commutator,
                ref_ptr<dp::TextureManager> texMng,
                ref_ptr<MetalineManager> metalineMng,
                CustomFeaturesContextWeakPtr customFeaturesContext,
                bool is3dBuildingsEnabled,
                bool isTrafficEnabled,
                bool isolinesEnabled,
                int displacementMode,
                TIsUGCFn const & isUGCFn);

  TileKey const & GetTileKey() const { return m_tileKey; }
  bool Is3dBuildingsEnabled() const { return m_3dBuildingsEnabled; }
  bool IsTrafficEnabled() const { return m_trafficEnabled; }
  bool IsolinesEnabled() const { return m_isolinesEnabled; }
  bool IsUGC(FeatureID const & fid) { return m_isUGCFn ? m_isUGCFn(fid) : false; }
  int GetDisplacementMode() const { return m_displacementMode; }
  CustomFeaturesContextWeakPtr GetCustomFeaturesContext() const { return m_customFeaturesContext; }
  ref_ptr<dp::TextureManager> GetTextureManager() const;
  ref_ptr<MetalineManager> GetMetalineManager() const;

  void BeginReadTile();
  void Flush(TMapShapes && shapes);
  void FlushOverlays(TMapShapes && shapes);
  void FlushTrafficGeometry(TrafficSegmentsGeometry && geometry);
  void EndReadTile();

private:
  void PostMessage(drape_ptr<Message> && message);

  TileKey m_tileKey;
  ref_ptr<ThreadsCommutator> m_commutator;
  ref_ptr<dp::TextureManager> m_texMng;
  ref_ptr<MetalineManager> m_metalineMng;
  CustomFeaturesContextWeakPtr m_customFeaturesContext;
  bool m_3dBuildingsEnabled;
  bool m_trafficEnabled;
  bool m_isolinesEnabled;
  int m_displacementMode;
  TIsUGCFn m_isUGCFn;
};
}  // namespace df
