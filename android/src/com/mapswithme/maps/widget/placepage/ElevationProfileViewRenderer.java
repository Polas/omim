package com.mapswithme.maps.widget.placepage;

import android.annotation.SuppressLint;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.mapswithme.maps.ChartController;
import com.mapswithme.maps.R;
import com.mapswithme.maps.bookmarks.data.ElevationInfo;
import com.mapswithme.maps.routing.RoutingController;

import java.util.Objects;

public class ElevationProfileViewRenderer implements PlacePageViewRenderer<PlacePageData>
{
  private static final int MAX_DIFFICULTY_LEVEL = 3;

  @SuppressWarnings("NullableProblems")
  @NonNull
  private TextView mTitle;
  @SuppressWarnings("NullableProblems")
  @NonNull
  private TextView mAscent;
  @SuppressWarnings("NullableProblems")
  @NonNull
  private TextView mDescent;
  @SuppressWarnings("NullableProblems")
  @NonNull
  private TextView mMaxAltitude;
  @SuppressWarnings("NullableProblems")
  @NonNull
  private TextView mMinAltitude;
  @SuppressWarnings("NullableProblems")
  @NonNull
  private TextView mTime;
  @NonNull
  private final View[] mDifficultyLevels = new View[MAX_DIFFICULTY_LEVEL];
  @SuppressWarnings("NullableProblems")
  @NonNull
  private ChartController mChartController;
  @Nullable
  private ElevationInfo mElevationInfo;

  @SuppressLint("SetTextI18n")
  @Override
  public void render(@NonNull PlacePageData data)
  {
    mElevationInfo = (ElevationInfo) data;
    mChartController.setData(mElevationInfo);
    Resources resources = mTitle.getResources();
    String meters = " " + resources.getString(R.string.elevation_profile_m);
    mTitle.setText(mElevationInfo.getName());
    setDifficulty(mElevationInfo.getDifficulty());
    mAscent.setText(mElevationInfo.getAscent() + meters);
    mDescent.setText(mElevationInfo.getDescent() +  meters);
    mMaxAltitude.setText(mElevationInfo.getMaxAltitude() + meters);
    mMinAltitude.setText(mElevationInfo.getMinAltitude() + meters);
    mTime.setText(RoutingController.formatRoutingTime(mTitle.getContext(),
                                                      (int) mElevationInfo.getDuration(),
                                                      R.dimen.text_size_body_2));
  }

  @Override
  public void initialize(@Nullable View view)
  {
    Objects.requireNonNull(view);
    mChartController = new ChartController(view.getContext());
    mChartController.initialize(view);
    mTitle = view.findViewById(R.id.title);
    mAscent = view.findViewById(R.id.ascent);
    mDescent = view.findViewById(R.id.descent);
    mMaxAltitude = view.findViewById(R.id.max_altitude);
    mMinAltitude = view.findViewById(R.id.min_altitude);
    mTime = view.findViewById(R.id.time);
    mDifficultyLevels[0] = view.findViewById(R.id.difficulty_level_1);
    mDifficultyLevels[1] = view.findViewById(R.id.difficulty_level_2);
    mDifficultyLevels[2] = view.findViewById(R.id.difficulty_level_3);
  }

  @Override
  public void destroy()
  {
    // No op.
  }

  private void setDifficulty(int level)
  {
    for (View levelView : mDifficultyLevels)
      levelView.setEnabled(false);

    for (int i = 0; i < level; i++)
      mDifficultyLevels[i].setEnabled(true);
  }

  @Override
  public void onSave(@NonNull Bundle outState)
  {
    outState.putParcelable(PlacePageUtils.EXTRA_PLACE_PAGE_DATA, mElevationInfo);
  }

  @Override
  public void onRestore(@NonNull Bundle inState)
  {
    mElevationInfo = inState.getParcelable(PlacePageUtils.EXTRA_PLACE_PAGE_DATA);
    if (mElevationInfo != null)
      render(mElevationInfo);
  }
}
