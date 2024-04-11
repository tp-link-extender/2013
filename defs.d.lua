-- Based on https://github.com/JohnnyMorganz/luau-lsp/blob/2bd0fb8a122932be67a16412591089e482bc3209/scripts/globalTypes.d.lua
-- Many void return types here are listed as `nil` instead of `()`, not fixing it

type Content = string
type ProtectedString = string
type BinaryString = string
type QDir = string
type QFont = string

declare class Enum
    function GetEnumItems(self): { any }
end

declare class EnumItem
    Name: string
    Value: number
    EnumType: Enum
    function IsA(self, enumName: string): boolean
end

declare debug: {
    info: (<R...>(thread, number, string) -> R...) & (<R...>(number, string) -> R...) & (<A..., R1..., R2...>((A...) -> R1..., string) -> R2...),
    traceback: ((string?, number?) -> string) & ((thread, string?, number?) -> string),
    profilebegin: (label: string) -> (),
    profileend: () -> (),
    setmemorycategory: (tag: string) -> (),
    resetmemorycategory: () -> (),
}

declare shared: any

declare function collectgarbage(mode: "count"): number
declare function warn<T...>(...: T...)
declare function tick(): number
declare function time(): number
declare function elapsedTime(): number
declare function wait(seconds: number?): (number, number)
declare function delay<T...>(delayTime: number?, callback: (T...) -> ())
declare function Delay<T...>(delayTime: number?, callback: (T...) -> ())
declare function spawn<T...>(callback: (T...) -> (), ...: any)
declare function Spawn<T...>(callback: (T...) -> (), ...: any)
declare function version(): string
declare function printidentity(prefix: string?)

declare class EnumActionType extends EnumItem end
declare class EnumActionType_INTERNAL extends Enum
	Nothing: EnumActionType
	Pause: EnumActionType
	Lose: EnumActionType
	Draw: EnumActionType
	Win: EnumActionType
end
declare class EnumActuatorRelativeTo extends EnumItem end
declare class EnumActuatorRelativeTo_INTERNAL extends Enum
	Attachment0: EnumActuatorRelativeTo
	Attachment1: EnumActuatorRelativeTo
	World: EnumActuatorRelativeTo
end
declare class EnumActuatorType extends EnumItem end
declare class EnumActuatorType_INTERNAL extends Enum
	None: EnumActuatorType
	Motor: EnumActuatorType
	Servo: EnumActuatorType
end
declare class EnumAdShape extends EnumItem end
declare class EnumAdShape_INTERNAL extends Enum
	HorizontalRectangle: EnumAdShape
end
declare class EnumAdTeleportMethod extends EnumItem end
declare class EnumAdTeleportMethod_INTERNAL extends Enum
	Undefined: EnumAdTeleportMethod
	PortalForward: EnumAdTeleportMethod
	InGameMenuBackButton: EnumAdTeleportMethod
	UIBackButton: EnumAdTeleportMethod
end
declare class EnumAdUnitStatus extends EnumItem end
declare class EnumAdUnitStatus_INTERNAL extends Enum
	Inactive: EnumAdUnitStatus
	Active: EnumAdUnitStatus
end
declare class EnumAdornCullingMode extends EnumItem end
declare class EnumAdornCullingMode_INTERNAL extends Enum
	Automatic: EnumAdornCullingMode
	Never: EnumAdornCullingMode
end
declare class EnumAlphaMode extends EnumItem end
declare class EnumAlphaMode_INTERNAL extends Enum
	Overlay: EnumAlphaMode
	Transparency: EnumAlphaMode
end
declare class EnumAnalyticsLogLevel extends EnumItem end
declare class EnumAnalyticsLogLevel_INTERNAL extends Enum
	Trace: EnumAnalyticsLogLevel
	Debug: EnumAnalyticsLogLevel
	Information: EnumAnalyticsLogLevel
	Warning: EnumAnalyticsLogLevel
	Error: EnumAnalyticsLogLevel
	Fatal: EnumAnalyticsLogLevel
end
declare class EnumAnalyticsProgressionStatus extends EnumItem end
declare class EnumAnalyticsProgressionStatus_INTERNAL extends Enum
	Default: EnumAnalyticsProgressionStatus
	Begin: EnumAnalyticsProgressionStatus
	Complete: EnumAnalyticsProgressionStatus
	Abandon: EnumAnalyticsProgressionStatus
	Fail: EnumAnalyticsProgressionStatus
end
declare class EnumAnimationPriority extends EnumItem end
declare class EnumAnimationPriority_INTERNAL extends Enum
	Idle: EnumAnimationPriority
	Movement: EnumAnimationPriority
	Action: EnumAnimationPriority
	Action2: EnumAnimationPriority
	Action3: EnumAnimationPriority
	Action4: EnumAnimationPriority
	Core: EnumAnimationPriority
end
declare class EnumAnimatorRetargetingMode extends EnumItem end
declare class EnumAnimatorRetargetingMode_INTERNAL extends Enum
	Default: EnumAnimatorRetargetingMode
	Disabled: EnumAnimatorRetargetingMode
	Enabled: EnumAnimatorRetargetingMode
end
declare class EnumAppShellActionType extends EnumItem end
declare class EnumAppShellActionType_INTERNAL extends Enum
	None: EnumAppShellActionType
	OpenApp: EnumAppShellActionType
	TapChatTab: EnumAppShellActionType
	TapConversationEntry: EnumAppShellActionType
	TapAvatarTab: EnumAppShellActionType
	ReadConversation: EnumAppShellActionType
	TapGamePageTab: EnumAppShellActionType
	TapHomePageTab: EnumAppShellActionType
	GamePageLoaded: EnumAppShellActionType
	HomePageLoaded: EnumAppShellActionType
	AvatarEditorPageLoaded: EnumAppShellActionType
end
declare class EnumAppShellFeature extends EnumItem end
declare class EnumAppShellFeature_INTERNAL extends Enum
	None: EnumAppShellFeature
	Chat: EnumAppShellFeature
	AvatarEditor: EnumAppShellFeature
	GamePage: EnumAppShellFeature
	HomePage: EnumAppShellFeature
	More: EnumAppShellFeature
	Landing: EnumAppShellFeature
end
declare class EnumAppUpdateStatus extends EnumItem end
declare class EnumAppUpdateStatus_INTERNAL extends Enum
	Unknown: EnumAppUpdateStatus
	NotSupported: EnumAppUpdateStatus
	Failed: EnumAppUpdateStatus
	NotAvailable: EnumAppUpdateStatus
	Available: EnumAppUpdateStatus
end
declare class EnumApplyStrokeMode extends EnumItem end
declare class EnumApplyStrokeMode_INTERNAL extends Enum
	Contextual: EnumApplyStrokeMode
	Border: EnumApplyStrokeMode
end
declare class EnumAspectType extends EnumItem end
declare class EnumAspectType_INTERNAL extends Enum
	FitWithinMaxSize: EnumAspectType
	ScaleWithParentSize: EnumAspectType
end
declare class EnumAssetFetchStatus extends EnumItem end
declare class EnumAssetFetchStatus_INTERNAL extends Enum
	Success: EnumAssetFetchStatus
	Failure: EnumAssetFetchStatus
	None: EnumAssetFetchStatus
	Loading: EnumAssetFetchStatus
	TimedOut: EnumAssetFetchStatus
end
declare class EnumAudioWindowSize extends EnumItem end
declare class EnumAudioWindowSize_INTERNAL extends Enum
	Small: EnumAudioWindowSize
	Medium: EnumAudioWindowSize
	Large: EnumAudioWindowSize
end
declare class EnumAutoIndentRule extends EnumItem end
declare class EnumAutoIndentRule_INTERNAL extends Enum
	Off: EnumAutoIndentRule
	Absolute: EnumAutoIndentRule
	Relative: EnumAutoIndentRule
end
declare class EnumAutomaticSize extends EnumItem end
declare class EnumAutomaticSize_INTERNAL extends Enum
	None: EnumAutomaticSize
	X: EnumAutomaticSize
	Y: EnumAutomaticSize
	XY: EnumAutomaticSize
end
declare class EnumAxis extends EnumItem end
declare class EnumAxis_INTERNAL extends Enum
	X: EnumAxis
	Y: EnumAxis
	Z: EnumAxis
end
declare class EnumBinType extends EnumItem end
declare class EnumBinType_INTERNAL extends Enum
	Script: EnumBinType
	GameTool: EnumBinType
	Grab: EnumBinType
	Clone: EnumBinType
	Hammer: EnumBinType
end
declare class EnumBodyPart extends EnumItem end
declare class EnumBodyPart_INTERNAL extends Enum
	Head: EnumBodyPart
	Torso: EnumBodyPart
	LeftArm: EnumBodyPart
	RightArm: EnumBodyPart
	LeftLeg: EnumBodyPart
	RightLeg: EnumBodyPart
end
declare class EnumBorderMode extends EnumItem end
declare class EnumBorderMode_INTERNAL extends Enum
	Outline: EnumBorderMode
	Middle: EnumBorderMode
	Inset: EnumBorderMode
end
declare class EnumBreakpointRemoveReason extends EnumItem end
declare class EnumBreakpointRemoveReason_INTERNAL extends Enum
	Requested: EnumBreakpointRemoveReason
	ScriptChanged: EnumBreakpointRemoveReason
	ScriptRemoved: EnumBreakpointRemoveReason
end
declare class EnumBulkMoveMode extends EnumItem end
declare class EnumBulkMoveMode_INTERNAL extends Enum
	FireAllEvents: EnumBulkMoveMode
	FireCFrameChanged: EnumBulkMoveMode
end
declare class EnumBundleType extends EnumItem end
declare class EnumBundleType_INTERNAL extends Enum
	BodyParts: EnumBundleType
	Animations: EnumBundleType
	Shoes: EnumBundleType
	DynamicHead: EnumBundleType
	DynamicHeadAvatar: EnumBundleType
end
declare class EnumButton extends EnumItem end
declare class EnumButton_INTERNAL extends Enum
	Jump: EnumButton
	Dismount: EnumButton
end
declare class EnumButtonStyle extends EnumItem end
declare class EnumButtonStyle_INTERNAL extends Enum
	Custom: EnumButtonStyle
	RobloxButtonDefault: EnumButtonStyle
	RobloxButton: EnumButtonStyle
	RobloxRoundButton: EnumButtonStyle
	RobloxRoundDefaultButton: EnumButtonStyle
	RobloxRoundDropdownButton: EnumButtonStyle
end
declare class EnumCageType extends EnumItem end
declare class EnumCageType_INTERNAL extends Enum
	Inner: EnumCageType
	Outer: EnumCageType
end
declare class EnumCameraMode extends EnumItem end
declare class EnumCameraMode_INTERNAL extends Enum
	Classic: EnumCameraMode
	LockFirstPerson: EnumCameraMode
end
declare class EnumCameraPanMode extends EnumItem end
declare class EnumCameraPanMode_INTERNAL extends Enum
	Classic: EnumCameraPanMode
	EdgeBump: EnumCameraPanMode
end
declare class EnumCameraType extends EnumItem end
declare class EnumCameraType_INTERNAL extends Enum
	Fixed: EnumCameraType
	Watch: EnumCameraType
	Attach: EnumCameraType
	Track: EnumCameraType
	Follow: EnumCameraType
	Custom: EnumCameraType
	Scriptable: EnumCameraType
	Orbital: EnumCameraType
end
declare class EnumCatalogCategoryFilter extends EnumItem end
declare class EnumCatalogCategoryFilter_INTERNAL extends Enum
	None: EnumCatalogCategoryFilter
	Featured: EnumCatalogCategoryFilter
	Collectibles: EnumCatalogCategoryFilter
	CommunityCreations: EnumCatalogCategoryFilter
	Premium: EnumCatalogCategoryFilter
	Recommended: EnumCatalogCategoryFilter
end
declare class EnumCatalogSortAggregation extends EnumItem end
declare class EnumCatalogSortAggregation_INTERNAL extends Enum
	Past12Hours: EnumCatalogSortAggregation
	PastDay: EnumCatalogSortAggregation
	Past3Days: EnumCatalogSortAggregation
	PastWeek: EnumCatalogSortAggregation
	PastMonth: EnumCatalogSortAggregation
	AllTime: EnumCatalogSortAggregation
end
declare class EnumCatalogSortType extends EnumItem end
declare class EnumCatalogSortType_INTERNAL extends Enum
	Relevance: EnumCatalogSortType
	PriceHighToLow: EnumCatalogSortType
	PriceLowToHigh: EnumCatalogSortType
	MostFavorited: EnumCatalogSortType
	RecentlyCreated: EnumCatalogSortType
	Bestselling: EnumCatalogSortType
end
declare class EnumCellBlock extends EnumItem end
declare class EnumCellBlock_INTERNAL extends Enum
	Solid: EnumCellBlock
	VerticalWedge: EnumCellBlock
	CornerWedge: EnumCellBlock
	InverseCornerWedge: EnumCellBlock
	HorizontalWedge: EnumCellBlock
end
declare class EnumCellMaterial extends EnumItem end
declare class EnumCellMaterial_INTERNAL extends Enum
	Empty: EnumCellMaterial
	Grass: EnumCellMaterial
	Sand: EnumCellMaterial
	Brick: EnumCellMaterial
	Granite: EnumCellMaterial
	Asphalt: EnumCellMaterial
	Iron: EnumCellMaterial
	Aluminum: EnumCellMaterial
	Gold: EnumCellMaterial
	WoodPlank: EnumCellMaterial
	WoodLog: EnumCellMaterial
	Gravel: EnumCellMaterial
	CinderBlock: EnumCellMaterial
	MossyStone: EnumCellMaterial
	Cement: EnumCellMaterial
	RedPlastic: EnumCellMaterial
	BluePlastic: EnumCellMaterial
	Water: EnumCellMaterial
end
declare class EnumCellOrientation extends EnumItem end
declare class EnumCellOrientation_INTERNAL extends Enum
	NegZ: EnumCellOrientation
	X: EnumCellOrientation
	Z: EnumCellOrientation
	NegX: EnumCellOrientation
end
declare class EnumCenterDialogType extends EnumItem end
declare class EnumCenterDialogType_INTERNAL extends Enum
	UnsolicitedDialog: EnumCenterDialogType
	PlayerInitiatedDialog: EnumCenterDialogType
	ModalDialog: EnumCenterDialogType
	QuitDialog: EnumCenterDialogType
end
declare class EnumChatCallbackType extends EnumItem end
declare class EnumChatCallbackType_INTERNAL extends Enum
	OnCreatingChatWindow: EnumChatCallbackType
	OnClientSendingMessage: EnumChatCallbackType
	OnClientFormattingMessage: EnumChatCallbackType
	OnServerReceivingMessage: EnumChatCallbackType
end
declare class EnumChatColor extends EnumItem end
declare class EnumChatColor_INTERNAL extends Enum
	Blue: EnumChatColor
	Green: EnumChatColor
	Red: EnumChatColor
	White: EnumChatColor
end
declare class EnumChatMode extends EnumItem end
declare class EnumChatMode_INTERNAL extends Enum
	Menu: EnumChatMode
	TextAndMenu: EnumChatMode
end
declare class EnumChatPrivacyMode extends EnumItem end
declare class EnumChatPrivacyMode_INTERNAL extends Enum
	AllUsers: EnumChatPrivacyMode
	NoOne: EnumChatPrivacyMode
	Friends: EnumChatPrivacyMode
end
declare class EnumChatStyle extends EnumItem end
declare class EnumChatStyle_INTERNAL extends Enum
	Classic: EnumChatStyle
	Bubble: EnumChatStyle
	ClassicAndBubble: EnumChatStyle
end
declare class EnumCommandPermission extends EnumItem end
declare class EnumCommandPermission_INTERNAL extends Enum
	Plugin: EnumCommandPermission
	LocalUser: EnumCommandPermission
end
declare class EnumCompletionTriggerKind extends EnumItem end
declare class EnumCompletionTriggerKind_INTERNAL extends Enum
	Invoked: EnumCompletionTriggerKind
	TriggerCharacter: EnumCompletionTriggerKind
	TriggerForIncompleteCompletions: EnumCompletionTriggerKind
end
declare class EnumComputerCameraMovementMode extends EnumItem end
declare class EnumComputerCameraMovementMode_INTERNAL extends Enum
	Default: EnumComputerCameraMovementMode
	Follow: EnumComputerCameraMovementMode
	Classic: EnumComputerCameraMovementMode
	Orbital: EnumComputerCameraMovementMode
	CameraToggle: EnumComputerCameraMovementMode
end
declare class EnumComputerMovementMode extends EnumItem end
declare class EnumComputerMovementMode_INTERNAL extends Enum
	Default: EnumComputerMovementMode
	KeyboardMouse: EnumComputerMovementMode
	ClickToMove: EnumComputerMovementMode
end
declare class EnumConnectionState extends EnumItem end
declare class EnumConnectionState_INTERNAL extends Enum
	Connected: EnumConnectionState
	Disconnected: EnumConnectionState
end
declare class EnumContextActionPriority extends EnumItem end
declare class EnumContextActionPriority_INTERNAL extends Enum
	Low: EnumContextActionPriority
	Medium: EnumContextActionPriority
	High: EnumContextActionPriority
end
declare class EnumContextActionResult extends EnumItem end
declare class EnumContextActionResult_INTERNAL extends Enum
	Pass: EnumContextActionResult
	Sink: EnumContextActionResult
end
declare class EnumControlMode extends EnumItem end
declare class EnumControlMode_INTERNAL extends Enum
	MouseLockSwitch: EnumControlMode
	["Mouse Lock Switch"]: EnumControlMode
	Classic: EnumControlMode
end
declare class EnumCoreGuiType extends EnumItem end
declare class EnumCoreGuiType_INTERNAL extends Enum
	PlayerList: EnumCoreGuiType
	Health: EnumCoreGuiType
	Backpack: EnumCoreGuiType
	Chat: EnumCoreGuiType
	All: EnumCoreGuiType
	EmotesMenu: EnumCoreGuiType
	SelfView: EnumCoreGuiType
end
declare class EnumCreatorType extends EnumItem end
declare class EnumCreatorType_INTERNAL extends Enum
	User: EnumCreatorType
	Group: EnumCreatorType
end
declare class EnumCreatorTypeFilter extends EnumItem end
declare class EnumCreatorTypeFilter_INTERNAL extends Enum
	User: EnumCreatorTypeFilter
	Group: EnumCreatorTypeFilter
	All: EnumCreatorTypeFilter
end
declare class EnumCurrencyType extends EnumItem end
declare class EnumCurrencyType_INTERNAL extends Enum
	Default: EnumCurrencyType
	Robux: EnumCurrencyType
	Tix: EnumCurrencyType
end
declare class EnumCustomCameraMode extends EnumItem end
declare class EnumCustomCameraMode_INTERNAL extends Enum
	Default: EnumCustomCameraMode
	Follow: EnumCustomCameraMode
	Classic: EnumCustomCameraMode
end
declare class EnumDebuggerEndReason extends EnumItem end
declare class EnumDebuggerEndReason_INTERNAL extends Enum
	ClientRequest: EnumDebuggerEndReason
	Timeout: EnumDebuggerEndReason
	InvalidHost: EnumDebuggerEndReason
	Disconnected: EnumDebuggerEndReason
	ServerShutdown: EnumDebuggerEndReason
	ServerProtocolMismatch: EnumDebuggerEndReason
	ConfigurationFailed: EnumDebuggerEndReason
	RpcError: EnumDebuggerEndReason
end
declare class EnumDebuggerExceptionBreakMode extends EnumItem end
declare class EnumDebuggerExceptionBreakMode_INTERNAL extends Enum
	Never: EnumDebuggerExceptionBreakMode
	Unhandled: EnumDebuggerExceptionBreakMode
	Always: EnumDebuggerExceptionBreakMode
end
declare class EnumDebuggerFrameType extends EnumItem end
declare class EnumDebuggerFrameType_INTERNAL extends Enum
	C: EnumDebuggerFrameType
	Lua: EnumDebuggerFrameType
end
declare class EnumDebuggerPauseReason extends EnumItem end
declare class EnumDebuggerPauseReason_INTERNAL extends Enum
	Unknown: EnumDebuggerPauseReason
	Requested: EnumDebuggerPauseReason
	Breakpoint: EnumDebuggerPauseReason
	Exception: EnumDebuggerPauseReason
	SingleStep: EnumDebuggerPauseReason
	Entrypoint: EnumDebuggerPauseReason
end
declare class EnumDebuggerStatus extends EnumItem end
declare class EnumDebuggerStatus_INTERNAL extends Enum
	Success: EnumDebuggerStatus
	Timeout: EnumDebuggerStatus
	ConnectionLost: EnumDebuggerStatus
	InvalidResponse: EnumDebuggerStatus
	InternalError: EnumDebuggerStatus
	InvalidState: EnumDebuggerStatus
	RpcError: EnumDebuggerStatus
	InvalidArgument: EnumDebuggerStatus
	ConnectionClosed: EnumDebuggerStatus
end
declare class EnumDevCameraOcclusionMode extends EnumItem end
declare class EnumDevCameraOcclusionMode_INTERNAL extends Enum
	Zoom: EnumDevCameraOcclusionMode
	Invisicam: EnumDevCameraOcclusionMode
end
declare class EnumDevComputerCameraMovementMode extends EnumItem end
declare class EnumDevComputerCameraMovementMode_INTERNAL extends Enum
	UserChoice: EnumDevComputerCameraMovementMode
	Classic: EnumDevComputerCameraMovementMode
	Follow: EnumDevComputerCameraMovementMode
	Orbital: EnumDevComputerCameraMovementMode
	CameraToggle: EnumDevComputerCameraMovementMode
end
declare class EnumDevComputerMovementMode extends EnumItem end
declare class EnumDevComputerMovementMode_INTERNAL extends Enum
	UserChoice: EnumDevComputerMovementMode
	KeyboardMouse: EnumDevComputerMovementMode
	ClickToMove: EnumDevComputerMovementMode
	Scriptable: EnumDevComputerMovementMode
end
declare class EnumDevTouchCameraMovementMode extends EnumItem end
declare class EnumDevTouchCameraMovementMode_INTERNAL extends Enum
	UserChoice: EnumDevTouchCameraMovementMode
	Classic: EnumDevTouchCameraMovementMode
	Follow: EnumDevTouchCameraMovementMode
	Orbital: EnumDevTouchCameraMovementMode
end
declare class EnumDevTouchMovementMode extends EnumItem end
declare class EnumDevTouchMovementMode_INTERNAL extends Enum
	UserChoice: EnumDevTouchMovementMode
	Thumbstick: EnumDevTouchMovementMode
	DPad: EnumDevTouchMovementMode
	Thumbpad: EnumDevTouchMovementMode
	ClickToMove: EnumDevTouchMovementMode
	Scriptable: EnumDevTouchMovementMode
	DynamicThumbstick: EnumDevTouchMovementMode
end
declare class EnumDeveloperMemoryTag extends EnumItem end
declare class EnumDeveloperMemoryTag_INTERNAL extends Enum
	Internal: EnumDeveloperMemoryTag
	HttpCache: EnumDeveloperMemoryTag
	Instances: EnumDeveloperMemoryTag
	Signals: EnumDeveloperMemoryTag
	LuaHeap: EnumDeveloperMemoryTag
	Script: EnumDeveloperMemoryTag
	PhysicsCollision: EnumDeveloperMemoryTag
	PhysicsParts: EnumDeveloperMemoryTag
	GraphicsSolidModels: EnumDeveloperMemoryTag
	GraphicsMeshParts: EnumDeveloperMemoryTag
	GraphicsParticles: EnumDeveloperMemoryTag
	GraphicsParts: EnumDeveloperMemoryTag
	GraphicsSpatialHash: EnumDeveloperMemoryTag
	GraphicsTerrain: EnumDeveloperMemoryTag
	GraphicsTexture: EnumDeveloperMemoryTag
	GraphicsTextureCharacter: EnumDeveloperMemoryTag
	Sounds: EnumDeveloperMemoryTag
	StreamingSounds: EnumDeveloperMemoryTag
	TerrainVoxels: EnumDeveloperMemoryTag
	Gui: EnumDeveloperMemoryTag
	Animation: EnumDeveloperMemoryTag
	Navigation: EnumDeveloperMemoryTag
	GeometryCSG: EnumDeveloperMemoryTag
end
declare class EnumDeviceType extends EnumItem end
declare class EnumDeviceType_INTERNAL extends Enum
	Unknown: EnumDeviceType
	Desktop: EnumDeviceType
	Tablet: EnumDeviceType
	Phone: EnumDeviceType
end
declare class EnumDialogBehaviorType extends EnumItem end
declare class EnumDialogBehaviorType_INTERNAL extends Enum
	SinglePlayer: EnumDialogBehaviorType
	MultiplePlayers: EnumDialogBehaviorType
end
declare class EnumDialogPurpose extends EnumItem end
declare class EnumDialogPurpose_INTERNAL extends Enum
	Quest: EnumDialogPurpose
	Help: EnumDialogPurpose
	Shop: EnumDialogPurpose
end
declare class EnumDialogTone extends EnumItem end
declare class EnumDialogTone_INTERNAL extends Enum
	Neutral: EnumDialogTone
	Friendly: EnumDialogTone
	Enemy: EnumDialogTone
end
declare class EnumDominantAxis extends EnumItem end
declare class EnumDominantAxis_INTERNAL extends Enum
	Width: EnumDominantAxis
	Height: EnumDominantAxis
end
declare class EnumDraftStatusCode extends EnumItem end
declare class EnumDraftStatusCode_INTERNAL extends Enum
	OK: EnumDraftStatusCode
	DraftOutdated: EnumDraftStatusCode
	ScriptRemoved: EnumDraftStatusCode
	DraftCommitted: EnumDraftStatusCode
end
declare class EnumDragDetectorDragStyle extends EnumItem end
declare class EnumDragDetectorDragStyle_INTERNAL extends Enum
	TranslateLine: EnumDragDetectorDragStyle
	TranslatePlane: EnumDragDetectorDragStyle
	TranslatePlaneOrLine: EnumDragDetectorDragStyle
	TranslateLineOrPlane: EnumDragDetectorDragStyle
	TranslateViewPlane: EnumDragDetectorDragStyle
	RotateAxis: EnumDragDetectorDragStyle
	RotateTrackball: EnumDragDetectorDragStyle
	Scriptable: EnumDragDetectorDragStyle
	BestForDevice: EnumDragDetectorDragStyle
end
declare class EnumDragDetectorResponseStyle extends EnumItem end
declare class EnumDragDetectorResponseStyle_INTERNAL extends Enum
	Geometric: EnumDragDetectorResponseStyle
	Physical: EnumDragDetectorResponseStyle
	Custom: EnumDragDetectorResponseStyle
end
declare class EnumDraggerCoordinateSpace extends EnumItem end
declare class EnumDraggerCoordinateSpace_INTERNAL extends Enum
	Object: EnumDraggerCoordinateSpace
	World: EnumDraggerCoordinateSpace
end
declare class EnumDraggerMovementMode extends EnumItem end
declare class EnumDraggerMovementMode_INTERNAL extends Enum
	Geometric: EnumDraggerMovementMode
	Physical: EnumDraggerMovementMode
end
declare class EnumEasingDirection extends EnumItem end
declare class EnumEasingDirection_INTERNAL extends Enum
	In: EnumEasingDirection
	Out: EnumEasingDirection
	InOut: EnumEasingDirection
end
declare class EnumEasingStyle extends EnumItem end
declare class EnumEasingStyle_INTERNAL extends Enum
	Linear: EnumEasingStyle
	Sine: EnumEasingStyle
	Back: EnumEasingStyle
	Quad: EnumEasingStyle
	Quart: EnumEasingStyle
	Quint: EnumEasingStyle
	Bounce: EnumEasingStyle
	Elastic: EnumEasingStyle
	Exponential: EnumEasingStyle
	Circular: EnumEasingStyle
	Cubic: EnumEasingStyle
end
declare class EnumElasticBehavior extends EnumItem end
declare class EnumElasticBehavior_INTERNAL extends Enum
	WhenScrollable: EnumElasticBehavior
	Always: EnumElasticBehavior
	Never: EnumElasticBehavior
end
declare class EnumEnviromentalPhysicsThrottle extends EnumItem end
declare class EnumEnviromentalPhysicsThrottle_INTERNAL extends Enum
	DefaultAuto: EnumEnviromentalPhysicsThrottle
	Disabled: EnumEnviromentalPhysicsThrottle
	Always: EnumEnviromentalPhysicsThrottle
	Skip2: EnumEnviromentalPhysicsThrottle
	Skip4: EnumEnviromentalPhysicsThrottle
	Skip8: EnumEnviromentalPhysicsThrottle
	Skip16: EnumEnviromentalPhysicsThrottle
end
declare class EnumExplosionType extends EnumItem end
declare class EnumExplosionType_INTERNAL extends Enum
	NoCraters: EnumExplosionType
	Craters: EnumExplosionType
end
declare class EnumFacialAnimationStreamingState extends EnumItem end
declare class EnumFacialAnimationStreamingState_INTERNAL extends Enum
	None: EnumFacialAnimationStreamingState
	Audio: EnumFacialAnimationStreamingState
	Video: EnumFacialAnimationStreamingState
	Place: EnumFacialAnimationStreamingState
	Server: EnumFacialAnimationStreamingState
end
declare class EnumFieldOfViewMode extends EnumItem end
declare class EnumFieldOfViewMode_INTERNAL extends Enum
	Vertical: EnumFieldOfViewMode
	Diagonal: EnumFieldOfViewMode
	MaxAxis: EnumFieldOfViewMode
end
declare class EnumFillDirection extends EnumItem end
declare class EnumFillDirection_INTERNAL extends Enum
	Horizontal: EnumFillDirection
	Vertical: EnumFillDirection
end
declare class EnumFilterResult extends EnumItem end
declare class EnumFilterResult_INTERNAL extends Enum
	Rejected: EnumFilterResult
	Accepted: EnumFilterResult
end
declare class EnumFinishRecordingOperation extends EnumItem end
declare class EnumFinishRecordingOperation_INTERNAL extends Enum
	Cancel: EnumFinishRecordingOperation
	Commit: EnumFinishRecordingOperation
	Append: EnumFinishRecordingOperation
end
declare class EnumFluidForces extends EnumItem end
declare class EnumFluidForces_INTERNAL extends Enum
	Default: EnumFluidForces
	Experimental: EnumFluidForces
end
declare class EnumFont extends EnumItem end
declare class EnumFont_INTERNAL extends Enum
	Legacy: EnumFont
	Arial: EnumFont
	ArialBold: EnumFont
	SourceSans: EnumFont
	SourceSansBold: EnumFont
	SourceSansSemibold: EnumFont
	SourceSansLight: EnumFont
	SourceSansItalic: EnumFont
	Bodoni: EnumFont
	Garamond: EnumFont
	Cartoon: EnumFont
	Code: EnumFont
	Highway: EnumFont
	SciFi: EnumFont
	Arcade: EnumFont
	Fantasy: EnumFont
	Antique: EnumFont
	Gotham: EnumFont
	GothamMedium: EnumFont
	GothamBold: EnumFont
	GothamBlack: EnumFont
	AmaticSC: EnumFont
	Bangers: EnumFont
	Creepster: EnumFont
	DenkOne: EnumFont
	Fondamento: EnumFont
	FredokaOne: EnumFont
	GrenzeGotisch: EnumFont
	IndieFlower: EnumFont
	JosefinSans: EnumFont
	Jura: EnumFont
	Kalam: EnumFont
	LuckiestGuy: EnumFont
	Merriweather: EnumFont
	Michroma: EnumFont
	Nunito: EnumFont
	Oswald: EnumFont
	PatrickHand: EnumFont
	PermanentMarker: EnumFont
	Roboto: EnumFont
	RobotoCondensed: EnumFont
	RobotoMono: EnumFont
	Sarpanch: EnumFont
	SpecialElite: EnumFont
	TitilliumWeb: EnumFont
	Ubuntu: EnumFont
	Unknown: EnumFont
end
declare class EnumFontSize extends EnumItem end
declare class EnumFontSize_INTERNAL extends Enum
	Size8: EnumFontSize
	Size9: EnumFontSize
	Size10: EnumFontSize
	Size11: EnumFontSize
	Size12: EnumFontSize
	Size14: EnumFontSize
	Size18: EnumFontSize
	Size24: EnumFontSize
	Size36: EnumFontSize
	Size48: EnumFontSize
end
declare class EnumFontStyle extends EnumItem end
declare class EnumFontStyle_INTERNAL extends Enum
	Normal: EnumFontStyle
	Italic: EnumFontStyle
end
declare class EnumFontWeight extends EnumItem end
declare class EnumFontWeight_INTERNAL extends Enum
	Thin: EnumFontWeight
	ExtraLight: EnumFontWeight
	Light: EnumFontWeight
	Regular: EnumFontWeight
	Medium: EnumFontWeight
	SemiBold: EnumFontWeight
	Bold: EnumFontWeight
	ExtraBold: EnumFontWeight
	Heavy: EnumFontWeight
end
declare class EnumForceLimitMode extends EnumItem end
declare class EnumForceLimitMode_INTERNAL extends Enum
	Magnitude: EnumForceLimitMode
	PerAxis: EnumForceLimitMode
end
declare class EnumFormFactor extends EnumItem end
declare class EnumFormFactor_INTERNAL extends Enum
	Symmetric: EnumFormFactor
	Brick: EnumFormFactor
	Plate: EnumFormFactor
	Custom: EnumFormFactor
end
declare class EnumFrameStyle extends EnumItem end
declare class EnumFrameStyle_INTERNAL extends Enum
	Custom: EnumFrameStyle
	ChatBlue: EnumFrameStyle
	RobloxSquare: EnumFrameStyle
	RobloxRound: EnumFrameStyle
	ChatGreen: EnumFrameStyle
	ChatRed: EnumFrameStyle
	DropShadow: EnumFrameStyle
end
declare class EnumFramerateManagerMode extends EnumItem end
declare class EnumFramerateManagerMode_INTERNAL extends Enum
	Automatic: EnumFramerateManagerMode
	On: EnumFramerateManagerMode
	Off: EnumFramerateManagerMode
end
declare class EnumFriendRequestEvent extends EnumItem end
declare class EnumFriendRequestEvent_INTERNAL extends Enum
	Issue: EnumFriendRequestEvent
	Revoke: EnumFriendRequestEvent
	Accept: EnumFriendRequestEvent
	Deny: EnumFriendRequestEvent
end
declare class EnumFriendStatus extends EnumItem end
declare class EnumFriendStatus_INTERNAL extends Enum
	Unknown: EnumFriendStatus
	NotFriend: EnumFriendStatus
	Friend: EnumFriendStatus
	FriendRequestSent: EnumFriendStatus
	FriendRequestReceived: EnumFriendStatus
end
declare class EnumFunctionalTestResult extends EnumItem end
declare class EnumFunctionalTestResult_INTERNAL extends Enum
	Passed: EnumFunctionalTestResult
	Warning: EnumFunctionalTestResult
	Error: EnumFunctionalTestResult
end
declare class EnumGearGenreSetting extends EnumItem end
declare class EnumGearGenreSetting_INTERNAL extends Enum
	AllGenres: EnumGearGenreSetting
	MatchingGenreOnly: EnumGearGenreSetting
end
declare class EnumGearType extends EnumItem end
declare class EnumGearType_INTERNAL extends Enum
	MeleeWeapons: EnumGearType
	RangedWeapons: EnumGearType
	Explosives: EnumGearType
	PowerUps: EnumGearType
	NavigationEnhancers: EnumGearType
	MusicalInstruments: EnumGearType
	SocialItems: EnumGearType
	BuildingTools: EnumGearType
	Transport: EnumGearType
end
declare class EnumGenre extends EnumItem end
declare class EnumGenre_INTERNAL extends Enum
	All: EnumGenre
	TownAndCity: EnumGenre
	Fantasy: EnumGenre
	SciFi: EnumGenre
	Ninja: EnumGenre
	Scary: EnumGenre
	Pirate: EnumGenre
	Adventure: EnumGenre
	Sports: EnumGenre
	Funny: EnumGenre
	WildWest: EnumGenre
	War: EnumGenre
	SkatePark: EnumGenre
	Tutorial: EnumGenre
end
declare class EnumGraphicsMode extends EnumItem end
declare class EnumGraphicsMode_INTERNAL extends Enum
	Automatic: EnumGraphicsMode
	Direct3D11: EnumGraphicsMode
	OpenGL: EnumGraphicsMode
	Metal: EnumGraphicsMode
	Vulkan: EnumGraphicsMode
	NoGraphics: EnumGraphicsMode
end
declare class EnumGuiState extends EnumItem end
declare class EnumGuiState_INTERNAL extends Enum
	Idle: EnumGuiState
	Hover: EnumGuiState
	Press: EnumGuiState
	NonInteractable: EnumGuiState
end
declare class EnumGuiType extends EnumItem end
declare class EnumGuiType_INTERNAL extends Enum
	Core: EnumGuiType
	Custom: EnumGuiType
	CustomBillboards: EnumGuiType
	PlayerNameplates: EnumGuiType
end
declare class EnumHandlesStyle extends EnumItem end
declare class EnumHandlesStyle_INTERNAL extends Enum
	Resize: EnumHandlesStyle
	Movement: EnumHandlesStyle
end
declare class EnumHighlightDepthMode extends EnumItem end
declare class EnumHighlightDepthMode_INTERNAL extends Enum
	AlwaysOnTop: EnumHighlightDepthMode
	Occluded: EnumHighlightDepthMode
end
declare class EnumHorizontalAlignment extends EnumItem end
declare class EnumHorizontalAlignment_INTERNAL extends Enum
	Center: EnumHorizontalAlignment
	Left: EnumHorizontalAlignment
	Right: EnumHorizontalAlignment
end
declare class EnumHoverAnimateSpeed extends EnumItem end
declare class EnumHoverAnimateSpeed_INTERNAL extends Enum
	VerySlow: EnumHoverAnimateSpeed
	Slow: EnumHoverAnimateSpeed
	Medium: EnumHoverAnimateSpeed
	Fast: EnumHoverAnimateSpeed
	VeryFast: EnumHoverAnimateSpeed
end
declare class EnumHttpCachePolicy extends EnumItem end
declare class EnumHttpCachePolicy_INTERNAL extends Enum
	None: EnumHttpCachePolicy
	Full: EnumHttpCachePolicy
	DataOnly: EnumHttpCachePolicy
	Default: EnumHttpCachePolicy
	InternalRedirectRefresh: EnumHttpCachePolicy
end
declare class EnumHttpContentType extends EnumItem end
declare class EnumHttpContentType_INTERNAL extends Enum
	ApplicationJson: EnumHttpContentType
	ApplicationXml: EnumHttpContentType
	ApplicationUrlEncoded: EnumHttpContentType
	TextPlain: EnumHttpContentType
	TextXml: EnumHttpContentType
end
declare class EnumHttpError extends EnumItem end
declare class EnumHttpError_INTERNAL extends Enum
	OK: EnumHttpError
	InvalidUrl: EnumHttpError
	DnsResolve: EnumHttpError
	ConnectFail: EnumHttpError
	OutOfMemory: EnumHttpError
	TimedOut: EnumHttpError
	TooManyRedirects: EnumHttpError
	InvalidRedirect: EnumHttpError
	NetFail: EnumHttpError
	Aborted: EnumHttpError
	SslConnectFail: EnumHttpError
	SslVerificationFail: EnumHttpError
	Unknown: EnumHttpError
end
declare class EnumHumanoidCollisionType extends EnumItem end
declare class EnumHumanoidCollisionType_INTERNAL extends Enum
	OuterBox: EnumHumanoidCollisionType
	InnerBox: EnumHumanoidCollisionType
end
declare class EnumHumanoidDisplayDistanceType extends EnumItem end
declare class EnumHumanoidDisplayDistanceType_INTERNAL extends Enum
	Viewer: EnumHumanoidDisplayDistanceType
	Subject: EnumHumanoidDisplayDistanceType
	None: EnumHumanoidDisplayDistanceType
end
declare class EnumHumanoidHealthDisplayType extends EnumItem end
declare class EnumHumanoidHealthDisplayType_INTERNAL extends Enum
	DisplayWhenDamaged: EnumHumanoidHealthDisplayType
	AlwaysOn: EnumHumanoidHealthDisplayType
	AlwaysOff: EnumHumanoidHealthDisplayType
end
declare class EnumHumanoidOnlySetCollisionsOnStateChange extends EnumItem end
declare class EnumHumanoidOnlySetCollisionsOnStateChange_INTERNAL extends Enum
	Default: EnumHumanoidOnlySetCollisionsOnStateChange
	Disabled: EnumHumanoidOnlySetCollisionsOnStateChange
	Enabled: EnumHumanoidOnlySetCollisionsOnStateChange
end
declare class EnumHumanoidStateType extends EnumItem end
declare class EnumHumanoidStateType_INTERNAL extends Enum
	FallingDown: EnumHumanoidStateType
	Running: EnumHumanoidStateType
	RunningNoPhysics: EnumHumanoidStateType
	Climbing: EnumHumanoidStateType
	StrafingNoPhysics: EnumHumanoidStateType
	Ragdoll: EnumHumanoidStateType
	GettingUp: EnumHumanoidStateType
	Jumping: EnumHumanoidStateType
	Landed: EnumHumanoidStateType
	Flying: EnumHumanoidStateType
	Freefall: EnumHumanoidStateType
	Seated: EnumHumanoidStateType
	PlatformStanding: EnumHumanoidStateType
	Dead: EnumHumanoidStateType
	Swimming: EnumHumanoidStateType
	Physics: EnumHumanoidStateType
	None: EnumHumanoidStateType
end
declare class EnumInOut extends EnumItem end
declare class EnumInOut_INTERNAL extends Enum
	Edge: EnumInOut
	Inset: EnumInOut
	Center: EnumInOut
end
declare class EnumInfoType extends EnumItem end
declare class EnumInfoType_INTERNAL extends Enum
	Asset: EnumInfoType
	Product: EnumInfoType
	GamePass: EnumInfoType
	Subscription: EnumInfoType
	Bundle: EnumInfoType
end
declare class EnumInitialDockState extends EnumItem end
declare class EnumInitialDockState_INTERNAL extends Enum
	Top: EnumInitialDockState
	Bottom: EnumInitialDockState
	Left: EnumInitialDockState
	Right: EnumInitialDockState
	Float: EnumInitialDockState
end
declare class EnumInputType extends EnumItem end
declare class EnumInputType_INTERNAL extends Enum
	NoInput: EnumInputType
	Constant: EnumInputType
	Sin: EnumInputType
end
declare class EnumInterpolationThrottlingMode extends EnumItem end
declare class EnumInterpolationThrottlingMode_INTERNAL extends Enum
	Default: EnumInterpolationThrottlingMode
	Disabled: EnumInterpolationThrottlingMode
	Enabled: EnumInterpolationThrottlingMode
end
declare class EnumJointCreationMode extends EnumItem end
declare class EnumJointCreationMode_INTERNAL extends Enum
	All: EnumJointCreationMode
	Surface: EnumJointCreationMode
	None: EnumJointCreationMode
end
declare class EnumKeyInterpolationMode extends EnumItem end
declare class EnumKeyInterpolationMode_INTERNAL extends Enum
	Constant: EnumKeyInterpolationMode
	Linear: EnumKeyInterpolationMode
	Cubic: EnumKeyInterpolationMode
end
declare class EnumKeywordFilterType extends EnumItem end
declare class EnumKeywordFilterType_INTERNAL extends Enum
	Include: EnumKeywordFilterType
	Exclude: EnumKeywordFilterType
end
declare class EnumLanguage extends EnumItem end
declare class EnumLanguage_INTERNAL extends Enum
	Default: EnumLanguage
end
declare class EnumLeftRight extends EnumItem end
declare class EnumLeftRight_INTERNAL extends Enum
	Left: EnumLeftRight
	Center: EnumLeftRight
	Right: EnumLeftRight
end
declare class EnumLimb extends EnumItem end
declare class EnumLimb_INTERNAL extends Enum
	Head: EnumLimb
	Torso: EnumLimb
	LeftArm: EnumLimb
	RightArm: EnumLimb
	LeftLeg: EnumLimb
	RightLeg: EnumLimb
	Unknown: EnumLimb
end
declare class EnumLineJoinMode extends EnumItem end
declare class EnumLineJoinMode_INTERNAL extends Enum
	Round: EnumLineJoinMode
	Bevel: EnumLineJoinMode
	Miter: EnumLineJoinMode
end
declare class EnumListDisplayMode extends EnumItem end
declare class EnumListDisplayMode_INTERNAL extends Enum
	Horizontal: EnumListDisplayMode
	Vertical: EnumListDisplayMode
end
declare class EnumListenerType extends EnumItem end
declare class EnumListenerType_INTERNAL extends Enum
	Camera: EnumListenerType
	CFrame: EnumListenerType
	ObjectPosition: EnumListenerType
	ObjectCFrame: EnumListenerType
end
declare class EnumLoadCharacterLayeredClothing extends EnumItem end
declare class EnumLoadCharacterLayeredClothing_INTERNAL extends Enum
	Default: EnumLoadCharacterLayeredClothing
	Disabled: EnumLoadCharacterLayeredClothing
	Enabled: EnumLoadCharacterLayeredClothing
end
declare class EnumLoadDynamicHeads extends EnumItem end
declare class EnumLoadDynamicHeads_INTERNAL extends Enum
	Default: EnumLoadDynamicHeads
	Disabled: EnumLoadDynamicHeads
	Enabled: EnumLoadDynamicHeads
end
declare class EnumMarkupKind extends EnumItem end
declare class EnumMarkupKind_INTERNAL extends Enum
	PlainText: EnumMarkupKind
	Markdown: EnumMarkupKind
end
declare class EnumMaterial extends EnumItem end
declare class EnumMaterial_INTERNAL extends Enum
	Plastic: EnumMaterial
	Wood: EnumMaterial
	Slate: EnumMaterial
	Concrete: EnumMaterial
	CorrodedMetal: EnumMaterial
	DiamondPlate: EnumMaterial
	Foil: EnumMaterial
	Grass: EnumMaterial
	Ice: EnumMaterial
	Marble: EnumMaterial
	Granite: EnumMaterial
	Brick: EnumMaterial
	Pebble: EnumMaterial
	Sand: EnumMaterial
	Fabric: EnumMaterial
	SmoothPlastic: EnumMaterial
	Metal: EnumMaterial
	WoodPlanks: EnumMaterial
	Cobblestone: EnumMaterial
	Air: EnumMaterial
	Water: EnumMaterial
	Rock: EnumMaterial
	Glacier: EnumMaterial
	Snow: EnumMaterial
	Sandstone: EnumMaterial
	Mud: EnumMaterial
	Basalt: EnumMaterial
	Ground: EnumMaterial
	CrackedLava: EnumMaterial
	Neon: EnumMaterial
	Glass: EnumMaterial
	Asphalt: EnumMaterial
	LeafyGrass: EnumMaterial
	Salt: EnumMaterial
	Limestone: EnumMaterial
	Pavement: EnumMaterial
	ForceField: EnumMaterial
	Cardboard: EnumMaterial
	Carpet: EnumMaterial
	CeramicTiles: EnumMaterial
	ClayRoofTiles: EnumMaterial
	RoofShingles: EnumMaterial
	Leather: EnumMaterial
	Plaster: EnumMaterial
	Rubber: EnumMaterial
end
declare class EnumMaterialPattern extends EnumItem end
declare class EnumMaterialPattern_INTERNAL extends Enum
	Regular: EnumMaterialPattern
	Organic: EnumMaterialPattern
end
declare class EnumMembershipType extends EnumItem end
declare class EnumMembershipType_INTERNAL extends Enum
	None: EnumMembershipType
	BuildersClub: EnumMembershipType
	TurboBuildersClub: EnumMembershipType
	OutrageousBuildersClub: EnumMembershipType
	_MEMBERSHIP_TYPE: EnumMembershipType
end
declare class EnumMeshPartDetailLevel extends EnumItem end
declare class EnumMeshPartDetailLevel_INTERNAL extends Enum
	DistanceBased: EnumMeshPartDetailLevel
	Level00: EnumMeshPartDetailLevel
	Level01: EnumMeshPartDetailLevel
	Level02: EnumMeshPartDetailLevel
	Level03: EnumMeshPartDetailLevel
	Level04: EnumMeshPartDetailLevel
end
declare class EnumMeshPartHeadsAndAccessories extends EnumItem end
declare class EnumMeshPartHeadsAndAccessories_INTERNAL extends Enum
	Default: EnumMeshPartHeadsAndAccessories
	Disabled: EnumMeshPartHeadsAndAccessories
	Enabled: EnumMeshPartHeadsAndAccessories
end
declare class EnumMeshScaleUnit extends EnumItem end
declare class EnumMeshScaleUnit_INTERNAL extends Enum
	Stud: EnumMeshScaleUnit
	Meter: EnumMeshScaleUnit
	CM: EnumMeshScaleUnit
	MM: EnumMeshScaleUnit
	Foot: EnumMeshScaleUnit
	Inch: EnumMeshScaleUnit
end
declare class EnumMeshType extends EnumItem end
declare class EnumMeshType_INTERNAL extends Enum
	Head: EnumMeshType
	Torso: EnumMeshType
	Wedge: EnumMeshType
	Prism: EnumMeshType
	Pyramid: EnumMeshType
	ParallelRamp: EnumMeshType
	RightAngleRamp: EnumMeshType
	CornerWedge: EnumMeshType
	Brick: EnumMeshType
	Sphere: EnumMeshType
	Cylinder: EnumMeshType
	FileMesh: EnumMeshType
end
declare class EnumMessageType extends EnumItem end
declare class EnumMessageType_INTERNAL extends Enum
	MessageOutput: EnumMessageType
	MessageInfo: EnumMessageType
	MessageWarning: EnumMessageType
	MessageError: EnumMessageType
end
declare class EnumModelLevelOfDetail extends EnumItem end
declare class EnumModelLevelOfDetail_INTERNAL extends Enum
	Automatic: EnumModelLevelOfDetail
	StreamingMesh: EnumModelLevelOfDetail
	Disabled: EnumModelLevelOfDetail
end
declare class EnumMoveState extends EnumItem end
declare class EnumMoveState_INTERNAL extends Enum
	Stopped: EnumMoveState
	Coasting: EnumMoveState
	Pushing: EnumMoveState
	Stopping: EnumMoveState
	AirFree: EnumMoveState
end
declare class EnumNameOcclusion extends EnumItem end
declare class EnumNameOcclusion_INTERNAL extends Enum
	OccludeAll: EnumNameOcclusion
	EnemyOcclusion: EnumNameOcclusion
	NoOcclusion: EnumNameOcclusion
end
declare class EnumNetworkOwnership extends EnumItem end
declare class EnumNetworkOwnership_INTERNAL extends Enum
	Automatic: EnumNetworkOwnership
	Manual: EnumNetworkOwnership
	OnContact: EnumNetworkOwnership
end
declare class EnumNormalId extends EnumItem end
declare class EnumNormalId_INTERNAL extends Enum
	Top: EnumNormalId
	Bottom: EnumNormalId
	Back: EnumNormalId
	Front: EnumNormalId
	Right: EnumNormalId
	Left: EnumNormalId
end
declare class EnumOrientationAlignmentMode extends EnumItem end
declare class EnumOrientationAlignmentMode_INTERNAL extends Enum
	OneAttachment: EnumOrientationAlignmentMode
	TwoAttachment: EnumOrientationAlignmentMode
end
declare class EnumOutfitSource extends EnumItem end
declare class EnumOutfitSource_INTERNAL extends Enum
	All: EnumOutfitSource
	Created: EnumOutfitSource
	Purchased: EnumOutfitSource
end
declare class EnumOutfitType extends EnumItem end
declare class EnumOutfitType_INTERNAL extends Enum
	All: EnumOutfitType
	Avatar: EnumOutfitType
	DynamicHead: EnumOutfitType
end
declare class EnumOutputLayoutMode extends EnumItem end
declare class EnumOutputLayoutMode_INTERNAL extends Enum
	Horizontal: EnumOutputLayoutMode
	Vertical: EnumOutputLayoutMode
end
declare class EnumPackagePermission extends EnumItem end
declare class EnumPackagePermission_INTERNAL extends Enum
	None: EnumPackagePermission
	NoAccess: EnumPackagePermission
	Revoked: EnumPackagePermission
	UseView: EnumPackagePermission
	Edit: EnumPackagePermission
	Own: EnumPackagePermission
end
declare class EnumPartType extends EnumItem end
declare class EnumPartType_INTERNAL extends Enum
	Ball: EnumPartType
	Block: EnumPartType
	Cylinder: EnumPartType
	Wedge: EnumPartType
	CornerWedge: EnumPartType
end
declare class EnumParticleOrientation extends EnumItem end
declare class EnumParticleOrientation_INTERNAL extends Enum
	FacingCamera: EnumParticleOrientation
	FacingCameraWorldUp: EnumParticleOrientation
	VelocityParallel: EnumParticleOrientation
	VelocityPerpendicular: EnumParticleOrientation
end
declare class EnumPathStatus extends EnumItem end
declare class EnumPathStatus_INTERNAL extends Enum
	Success: EnumPathStatus
	ClosestNoPath: EnumPathStatus
	ClosestOutOfRange: EnumPathStatus
	FailStartNotEmpty: EnumPathStatus
	FailFinishNotEmpty: EnumPathStatus
	NoPath: EnumPathStatus
end
declare class EnumPathWaypointAction extends EnumItem end
declare class EnumPathWaypointAction_INTERNAL extends Enum
	Walk: EnumPathWaypointAction
	Jump: EnumPathWaypointAction
	Custom: EnumPathWaypointAction
end
declare class EnumPermissionLevelShown extends EnumItem end
declare class EnumPermissionLevelShown_INTERNAL extends Enum
	Game: EnumPermissionLevelShown
	RobloxGame: EnumPermissionLevelShown
	RobloxScript: EnumPermissionLevelShown
	Studio: EnumPermissionLevelShown
	Roblox: EnumPermissionLevelShown
end
declare class EnumPhysicsSimulationRate extends EnumItem end
declare class EnumPhysicsSimulationRate_INTERNAL extends Enum
	Fixed240Hz: EnumPhysicsSimulationRate
	Fixed120Hz: EnumPhysicsSimulationRate
	Fixed60Hz: EnumPhysicsSimulationRate
end
declare class EnumPhysicsSteppingMethod extends EnumItem end
declare class EnumPhysicsSteppingMethod_INTERNAL extends Enum
	Default: EnumPhysicsSteppingMethod
	Fixed: EnumPhysicsSteppingMethod
	Adaptive: EnumPhysicsSteppingMethod
end
declare class EnumPlatform extends EnumItem end
declare class EnumPlatform_INTERNAL extends Enum
	Windows: EnumPlatform
	OSX: EnumPlatform
	IOS: EnumPlatform
	Android: EnumPlatform
	XBoxOne: EnumPlatform
	PS4: EnumPlatform
	PS3: EnumPlatform
	XBox360: EnumPlatform
	WiiU: EnumPlatform
	NX: EnumPlatform
	Ouya: EnumPlatform
	AndroidTV: EnumPlatform
	Chromecast: EnumPlatform
	Linux: EnumPlatform
	SteamOS: EnumPlatform
	WebOS: EnumPlatform
	DOS: EnumPlatform
	BeOS: EnumPlatform
	UWP: EnumPlatform
	None: EnumPlatform
end
declare class EnumPlaybackState extends EnumItem end
declare class EnumPlaybackState_INTERNAL extends Enum
	Begin: EnumPlaybackState
	Delayed: EnumPlaybackState
	Playing: EnumPlaybackState
	Paused: EnumPlaybackState
	Completed: EnumPlaybackState
	Cancelled: EnumPlaybackState
end
declare class EnumPlayerActions extends EnumItem end
declare class EnumPlayerActions_INTERNAL extends Enum
	CharacterForward: EnumPlayerActions
	CharacterBackward: EnumPlayerActions
	CharacterLeft: EnumPlayerActions
	CharacterRight: EnumPlayerActions
	CharacterJump: EnumPlayerActions
end
declare class EnumPlayerChatType extends EnumItem end
declare class EnumPlayerChatType_INTERNAL extends Enum
	All: EnumPlayerChatType
	Team: EnumPlayerChatType
	Whisper: EnumPlayerChatType
end
declare class EnumPoseEasingDirection extends EnumItem end
declare class EnumPoseEasingDirection_INTERNAL extends Enum
	Out: EnumPoseEasingDirection
	InOut: EnumPoseEasingDirection
	In: EnumPoseEasingDirection
end
declare class EnumPoseEasingStyle extends EnumItem end
declare class EnumPoseEasingStyle_INTERNAL extends Enum
	Linear: EnumPoseEasingStyle
	Constant: EnumPoseEasingStyle
	Elastic: EnumPoseEasingStyle
	Cubic: EnumPoseEasingStyle
	Bounce: EnumPoseEasingStyle
end
declare class EnumPositionAlignmentMode extends EnumItem end
declare class EnumPositionAlignmentMode_INTERNAL extends Enum
	OneAttachment: EnumPositionAlignmentMode
	TwoAttachment: EnumPositionAlignmentMode
end
declare class EnumPrivilegeType extends EnumItem end
declare class EnumPrivilegeType_INTERNAL extends Enum
	Owner: EnumPrivilegeType
	Admin: EnumPrivilegeType
	Member: EnumPrivilegeType
	Visitor: EnumPrivilegeType
	Banned: EnumPrivilegeType
end
declare class EnumProductPurchaseDecision extends EnumItem end
declare class EnumProductPurchaseDecision_INTERNAL extends Enum
	NotProcessedYet: EnumProductPurchaseDecision
	PurchaseGranted: EnumProductPurchaseDecision
end
declare class EnumPromptCreateAssetResult extends EnumItem end
declare class EnumPromptCreateAssetResult_INTERNAL extends Enum
	Success: EnumPromptCreateAssetResult
	PermissionDenied: EnumPromptCreateAssetResult
	Timeout: EnumPromptCreateAssetResult
	UploadFailed: EnumPromptCreateAssetResult
	NoUserInput: EnumPromptCreateAssetResult
	UnknownFailure: EnumPromptCreateAssetResult
end
declare class EnumPromptPublishAssetResult extends EnumItem end
declare class EnumPromptPublishAssetResult_INTERNAL extends Enum
	Success: EnumPromptPublishAssetResult
	PermissionDenied: EnumPromptPublishAssetResult
	Timeout: EnumPromptPublishAssetResult
	UploadFailed: EnumPromptPublishAssetResult
	NoUserInput: EnumPromptPublishAssetResult
	UnknownFailure: EnumPromptPublishAssetResult
end
declare class EnumPropertyStatus extends EnumItem end
declare class EnumPropertyStatus_INTERNAL extends Enum
	Ok: EnumPropertyStatus
	Warning: EnumPropertyStatus
	Error: EnumPropertyStatus
end
declare class EnumQualityLevel extends EnumItem end
declare class EnumQualityLevel_INTERNAL extends Enum
	Automatic: EnumQualityLevel
	Level01: EnumQualityLevel
	Level02: EnumQualityLevel
	Level03: EnumQualityLevel
	Level04: EnumQualityLevel
	Level05: EnumQualityLevel
	Level06: EnumQualityLevel
	Level07: EnumQualityLevel
	Level08: EnumQualityLevel
	Level09: EnumQualityLevel
	Level10: EnumQualityLevel
	Level11: EnumQualityLevel
	Level12: EnumQualityLevel
	Level13: EnumQualityLevel
	Level14: EnumQualityLevel
	Level15: EnumQualityLevel
	Level16: EnumQualityLevel
	Level17: EnumQualityLevel
	Level18: EnumQualityLevel
	Level19: EnumQualityLevel
	Level20: EnumQualityLevel
	Level21: EnumQualityLevel
end
declare class EnumRaycastFilterType extends EnumItem end
declare class EnumRaycastFilterType_INTERNAL extends Enum
	Exclude: EnumRaycastFilterType
	Include: EnumRaycastFilterType
end
declare class EnumRenderFidelity extends EnumItem end
declare class EnumRenderFidelity_INTERNAL extends Enum
	Automatic: EnumRenderFidelity
	Precise: EnumRenderFidelity
	Performance: EnumRenderFidelity
end
declare class EnumRenderPriority extends EnumItem end
declare class EnumRenderPriority_INTERNAL extends Enum
	First: EnumRenderPriority
	Input: EnumRenderPriority
	Camera: EnumRenderPriority
	Character: EnumRenderPriority
	Last: EnumRenderPriority
end
declare class EnumReservedHighlightId extends EnumItem end
declare class EnumReservedHighlightId_INTERNAL extends Enum
	Standard: EnumReservedHighlightId
	Selection: EnumReservedHighlightId
	Hover: EnumReservedHighlightId
	Active: EnumReservedHighlightId
end
declare class EnumReturnKeyType extends EnumItem end
declare class EnumReturnKeyType_INTERNAL extends Enum
	Default: EnumReturnKeyType
	Done: EnumReturnKeyType
	Go: EnumReturnKeyType
	Next: EnumReturnKeyType
	Search: EnumReturnKeyType
	Send: EnumReturnKeyType
end
declare class EnumReverbType extends EnumItem end
declare class EnumReverbType_INTERNAL extends Enum
	NoReverb: EnumReverbType
	GenericReverb: EnumReverbType
	PaddedCell: EnumReverbType
	Room: EnumReverbType
	Bathroom: EnumReverbType
	LivingRoom: EnumReverbType
	StoneRoom: EnumReverbType
	Auditorium: EnumReverbType
	ConcertHall: EnumReverbType
	Cave: EnumReverbType
	Arena: EnumReverbType
	Hangar: EnumReverbType
	CarpettedHallway: EnumReverbType
	Hallway: EnumReverbType
	StoneCorridor: EnumReverbType
	Alley: EnumReverbType
	Forest: EnumReverbType
	City: EnumReverbType
	Mountains: EnumReverbType
	Quarry: EnumReverbType
	Plain: EnumReverbType
	ParkingLot: EnumReverbType
	SewerPipe: EnumReverbType
	UnderWater: EnumReverbType
end
declare class EnumRibbonTool extends EnumItem end
declare class EnumRibbonTool_INTERNAL extends Enum
	Select: EnumRibbonTool
	Scale: EnumRibbonTool
	Rotate: EnumRibbonTool
	Move: EnumRibbonTool
	Transform: EnumRibbonTool
	ColorPicker: EnumRibbonTool
	MaterialPicker: EnumRibbonTool
	Group: EnumRibbonTool
	Ungroup: EnumRibbonTool
	None: EnumRibbonTool
end
declare class EnumRigScale extends EnumItem end
declare class EnumRigScale_INTERNAL extends Enum
	Default: EnumRigScale
	Rthro: EnumRigScale
	RthroNarrow: EnumRigScale
end
declare class EnumRollOffMode extends EnumItem end
declare class EnumRollOffMode_INTERNAL extends Enum
	Inverse: EnumRollOffMode
	Linear: EnumRollOffMode
	InverseTapered: EnumRollOffMode
	LinearSquare: EnumRollOffMode
end
declare class EnumRotationOrder extends EnumItem end
declare class EnumRotationOrder_INTERNAL extends Enum
	XYZ: EnumRotationOrder
	XZY: EnumRotationOrder
	YZX: EnumRotationOrder
	YXZ: EnumRotationOrder
	ZXY: EnumRotationOrder
	ZYX: EnumRotationOrder
end
declare class EnumRotationType extends EnumItem end
declare class EnumRotationType_INTERNAL extends Enum
	MovementRelative: EnumRotationType
	CameraRelative: EnumRotationType
end
declare class EnumRtlTextSupport extends EnumItem end
declare class EnumRtlTextSupport_INTERNAL extends Enum
	Default: EnumRtlTextSupport
	Disabled: EnumRtlTextSupport
	Enabled: EnumRtlTextSupport
end
declare class EnumRunContext extends EnumItem end
declare class EnumRunContext_INTERNAL extends Enum
	Legacy: EnumRunContext
	Server: EnumRunContext
	Client: EnumRunContext
	Plugin: EnumRunContext
end
declare class EnumRuntimeUndoBehavior extends EnumItem end
declare class EnumRuntimeUndoBehavior_INTERNAL extends Enum
	Aggregate: EnumRuntimeUndoBehavior
	Snapshot: EnumRuntimeUndoBehavior
	Hybrid: EnumRuntimeUndoBehavior
end
declare class EnumSafeAreaCompatibility extends EnumItem end
declare class EnumSafeAreaCompatibility_INTERNAL extends Enum
	None: EnumSafeAreaCompatibility
	FullscreenExtension: EnumSafeAreaCompatibility
end
declare class EnumSalesTypeFilter extends EnumItem end
declare class EnumSalesTypeFilter_INTERNAL extends Enum
	All: EnumSalesTypeFilter
	Collectibles: EnumSalesTypeFilter
	Premium: EnumSalesTypeFilter
end
declare class EnumSaveAvatarThumbnailCustomizationFailure extends EnumItem end
declare class EnumSaveAvatarThumbnailCustomizationFailure_INTERNAL extends Enum
	BadThumbnailType: EnumSaveAvatarThumbnailCustomizationFailure
	BadYRotDeg: EnumSaveAvatarThumbnailCustomizationFailure
	BadFieldOfViewDeg: EnumSaveAvatarThumbnailCustomizationFailure
	BadDistanceScale: EnumSaveAvatarThumbnailCustomizationFailure
	Other: EnumSaveAvatarThumbnailCustomizationFailure
end
declare class EnumSaveFilter extends EnumItem end
declare class EnumSaveFilter_INTERNAL extends Enum
	SaveAll: EnumSaveFilter
	SaveWorld: EnumSaveFilter
	SaveGame: EnumSaveFilter
end
declare class EnumSavedQualitySetting extends EnumItem end
declare class EnumSavedQualitySetting_INTERNAL extends Enum
	Automatic: EnumSavedQualitySetting
	QualityLevel1: EnumSavedQualitySetting
	QualityLevel2: EnumSavedQualitySetting
	QualityLevel3: EnumSavedQualitySetting
	QualityLevel4: EnumSavedQualitySetting
	QualityLevel5: EnumSavedQualitySetting
	QualityLevel6: EnumSavedQualitySetting
	QualityLevel7: EnumSavedQualitySetting
	QualityLevel8: EnumSavedQualitySetting
	QualityLevel9: EnumSavedQualitySetting
	QualityLevel10: EnumSavedQualitySetting
end
declare class EnumScopeCheckResult extends EnumItem end
declare class EnumScopeCheckResult_INTERNAL extends Enum
	ConsentAccepted: EnumScopeCheckResult
	InvalidScopes: EnumScopeCheckResult
	Timeout: EnumScopeCheckResult
	NoUserInput: EnumScopeCheckResult
	BackendError: EnumScopeCheckResult
	UnexpectedError: EnumScopeCheckResult
	InvalidArgument: EnumScopeCheckResult
	ConsentDenied: EnumScopeCheckResult
end
declare class EnumScrollBarInset extends EnumItem end
declare class EnumScrollBarInset_INTERNAL extends Enum
	None: EnumScrollBarInset
	ScrollBar: EnumScrollBarInset
	Always: EnumScrollBarInset
end
declare class EnumScrollingDirection extends EnumItem end
declare class EnumScrollingDirection_INTERNAL extends Enum
	X: EnumScrollingDirection
	Y: EnumScrollingDirection
	XY: EnumScrollingDirection
end
declare class EnumSelectionBehavior extends EnumItem end
declare class EnumSelectionBehavior_INTERNAL extends Enum
	Escape: EnumSelectionBehavior
	Stop: EnumSelectionBehavior
end
declare class EnumSelectionRenderMode extends EnumItem end
declare class EnumSelectionRenderMode_INTERNAL extends Enum
	Outlines: EnumSelectionRenderMode
	BoundingBoxes: EnumSelectionRenderMode
	Both: EnumSelectionRenderMode
end
declare class EnumServiceVisibility extends EnumItem end
declare class EnumServiceVisibility_INTERNAL extends Enum
	Always: EnumServiceVisibility
	Off: EnumServiceVisibility
	WithChildren: EnumServiceVisibility
end
declare class EnumSeverity extends EnumItem end
declare class EnumSeverity_INTERNAL extends Enum
	Error: EnumSeverity
	Warning: EnumSeverity
	Information: EnumSeverity
	Hint: EnumSeverity
end
declare class EnumSignalBehavior extends EnumItem end
declare class EnumSignalBehavior_INTERNAL extends Enum
	Default: EnumSignalBehavior
	Immediate: EnumSignalBehavior
	Deferred: EnumSignalBehavior
	AncestryDeferred: EnumSignalBehavior
end
declare class EnumSizeConstraint extends EnumItem end
declare class EnumSizeConstraint_INTERNAL extends Enum
	RelativeXY: EnumSizeConstraint
	RelativeXX: EnumSizeConstraint
	RelativeYY: EnumSizeConstraint
end
declare class EnumSolverConvergenceVisualizationMode extends EnumItem end
declare class EnumSolverConvergenceVisualizationMode_INTERNAL extends Enum
	Disabled: EnumSolverConvergenceVisualizationMode
	PerIsland: EnumSolverConvergenceVisualizationMode
	PerEdge: EnumSolverConvergenceVisualizationMode
end
declare class EnumSortOrder extends EnumItem end
declare class EnumSortOrder_INTERNAL extends Enum
	LayoutOrder: EnumSortOrder
	Name: EnumSortOrder
	Custom: EnumSortOrder
end
declare class EnumSpecialKey extends EnumItem end
declare class EnumSpecialKey_INTERNAL extends Enum
	Insert: EnumSpecialKey
	Home: EnumSpecialKey
	End: EnumSpecialKey
	PageUp: EnumSpecialKey
	PageDown: EnumSpecialKey
	ChatHotkey: EnumSpecialKey
end
declare class EnumStartCorner extends EnumItem end
declare class EnumStartCorner_INTERNAL extends Enum
	TopLeft: EnumStartCorner
	TopRight: EnumStartCorner
	BottomLeft: EnumStartCorner
	BottomRight: EnumStartCorner
end
declare class EnumStatus extends EnumItem end
declare class EnumStatus_INTERNAL extends Enum
	Poison: EnumStatus
	Confusion: EnumStatus
end
declare class EnumStreamOutBehavior extends EnumItem end
declare class EnumStreamOutBehavior_INTERNAL extends Enum
	Default: EnumStreamOutBehavior
	LowMemory: EnumStreamOutBehavior
	Opportunistic: EnumStreamOutBehavior
end
declare class EnumStreamingIntegrityMode extends EnumItem end
declare class EnumStreamingIntegrityMode_INTERNAL extends Enum
	Default: EnumStreamingIntegrityMode
	Disabled: EnumStreamingIntegrityMode
	MinimumRadiusPause: EnumStreamingIntegrityMode
	PauseOutsideLoadedArea: EnumStreamingIntegrityMode
end
declare class EnumStreamingPauseMode extends EnumItem end
declare class EnumStreamingPauseMode_INTERNAL extends Enum
	Default: EnumStreamingPauseMode
	Disabled: EnumStreamingPauseMode
	ClientPhysicsPause: EnumStreamingPauseMode
end
declare class EnumStudioCloseMode extends EnumItem end
declare class EnumStudioCloseMode_INTERNAL extends Enum
	None: EnumStudioCloseMode
	CloseStudio: EnumStudioCloseMode
	CloseDoc: EnumStudioCloseMode
end
declare class EnumStudioStyleGuideModifier extends EnumItem end
declare class EnumStudioStyleGuideModifier_INTERNAL extends Enum
	Default: EnumStudioStyleGuideModifier
	Selected: EnumStudioStyleGuideModifier
	Pressed: EnumStudioStyleGuideModifier
	Disabled: EnumStudioStyleGuideModifier
	Hover: EnumStudioStyleGuideModifier
end
declare class EnumStyle extends EnumItem end
declare class EnumStyle_INTERNAL extends Enum
	AlternatingSupports: EnumStyle
	BridgeStyleSupports: EnumStyle
	NoSupports: EnumStyle
end
declare class EnumSurfaceConstraint extends EnumItem end
declare class EnumSurfaceConstraint_INTERNAL extends Enum
	None: EnumSurfaceConstraint
	Hinge: EnumSurfaceConstraint
	SteppingMotor: EnumSurfaceConstraint
	Motor: EnumSurfaceConstraint
end
declare class EnumSurfaceGuiShape extends EnumItem end
declare class EnumSurfaceGuiShape_INTERNAL extends Enum
	Flat: EnumSurfaceGuiShape
	CurvedHorizontally: EnumSurfaceGuiShape
end
declare class EnumSurfaceGuiSizingMode extends EnumItem end
declare class EnumSurfaceGuiSizingMode_INTERNAL extends Enum
	FixedSize: EnumSurfaceGuiSizingMode
	PixelsPerStud: EnumSurfaceGuiSizingMode
end
declare class EnumSurfaceType extends EnumItem end
declare class EnumSurfaceType_INTERNAL extends Enum
	Smooth: EnumSurfaceType
	Glue: EnumSurfaceType
	Weld: EnumSurfaceType
	Studs: EnumSurfaceType
	Inlet: EnumSurfaceType
	Universal: EnumSurfaceType
	Hinge: EnumSurfaceType
	Motor: EnumSurfaceType
	SteppingMotor: EnumSurfaceType
	SmoothNoOutlines: EnumSurfaceType
end
declare class EnumSwipeDirection extends EnumItem end
declare class EnumSwipeDirection_INTERNAL extends Enum
	Right: EnumSwipeDirection
	Left: EnumSwipeDirection
	Up: EnumSwipeDirection
	Down: EnumSwipeDirection
	None: EnumSwipeDirection
end
declare class EnumTableMajorAxis extends EnumItem end
declare class EnumTableMajorAxis_INTERNAL extends Enum
	RowMajor: EnumTableMajorAxis
	ColumnMajor: EnumTableMajorAxis
end
declare class EnumTechnology extends EnumItem end
declare class EnumTechnology_INTERNAL extends Enum
	Compatibility: EnumTechnology
	Voxel: EnumTechnology
	ShadowMap: EnumTechnology
	Legacy: EnumTechnology
	Future: EnumTechnology
end
declare class EnumTeleportMethod extends EnumItem end
declare class EnumTeleportMethod_INTERNAL extends Enum
	TeleportToSpawnByName: EnumTeleportMethod
	TeleportToPlaceInstance: EnumTeleportMethod
	TeleportToPrivateServer: EnumTeleportMethod
	TeleportPartyAsync: EnumTeleportMethod
	TeleportUnknown: EnumTeleportMethod
end
declare class EnumTeleportResult extends EnumItem end
declare class EnumTeleportResult_INTERNAL extends Enum
	Success: EnumTeleportResult
	Failure: EnumTeleportResult
	GameNotFound: EnumTeleportResult
	GameEnded: EnumTeleportResult
	GameFull: EnumTeleportResult
	Unauthorized: EnumTeleportResult
	Flooded: EnumTeleportResult
	IsTeleporting: EnumTeleportResult
end
declare class EnumTeleportState extends EnumItem end
declare class EnumTeleportState_INTERNAL extends Enum
	RequestedFromServer: EnumTeleportState
	Started: EnumTeleportState
	WaitingForServer: EnumTeleportState
	Failed: EnumTeleportState
	InProgress: EnumTeleportState
end
declare class EnumTeleportType extends EnumItem end
declare class EnumTeleportType_INTERNAL extends Enum
	ToPlace: EnumTeleportType
	ToInstance: EnumTeleportType
	ToReservedServer: EnumTeleportType
end
declare class EnumTextFilterContext extends EnumItem end
declare class EnumTextFilterContext_INTERNAL extends Enum
	PublicChat: EnumTextFilterContext
	PrivateChat: EnumTextFilterContext
end
declare class EnumTextInputType extends EnumItem end
declare class EnumTextInputType_INTERNAL extends Enum
	Default: EnumTextInputType
	NoSuggestions: EnumTextInputType
	Number: EnumTextInputType
	Email: EnumTextInputType
	Phone: EnumTextInputType
	Password: EnumTextInputType
	PasswordShown: EnumTextInputType
	Username: EnumTextInputType
	OneTimePassword: EnumTextInputType
end
declare class EnumTextTruncate extends EnumItem end
declare class EnumTextTruncate_INTERNAL extends Enum
	None: EnumTextTruncate
	AtEnd: EnumTextTruncate
end
declare class EnumTextXAlignment extends EnumItem end
declare class EnumTextXAlignment_INTERNAL extends Enum
	Left: EnumTextXAlignment
	Center: EnumTextXAlignment
	Right: EnumTextXAlignment
end
declare class EnumTextYAlignment extends EnumItem end
declare class EnumTextYAlignment_INTERNAL extends Enum
	Top: EnumTextYAlignment
	Center: EnumTextYAlignment
	Bottom: EnumTextYAlignment
end
declare class EnumTextureMode extends EnumItem end
declare class EnumTextureMode_INTERNAL extends Enum
	Stretch: EnumTextureMode
	Wrap: EnumTextureMode
	Static: EnumTextureMode
end
declare class EnumTextureQueryType extends EnumItem end
declare class EnumTextureQueryType_INTERNAL extends Enum
	NonHumanoid: EnumTextureQueryType
	NonHumanoidOrphaned: EnumTextureQueryType
	Humanoid: EnumTextureQueryType
	HumanoidOrphaned: EnumTextureQueryType
end
declare class EnumThreadPoolConfig extends EnumItem end
declare class EnumThreadPoolConfig_INTERNAL extends Enum
	Auto: EnumThreadPoolConfig
	PerCore1: EnumThreadPoolConfig
	PerCore2: EnumThreadPoolConfig
	PerCore3: EnumThreadPoolConfig
	PerCore4: EnumThreadPoolConfig
	Threads1: EnumThreadPoolConfig
	Threads2: EnumThreadPoolConfig
	Threads3: EnumThreadPoolConfig
	Threads4: EnumThreadPoolConfig
	Threads8: EnumThreadPoolConfig
	Threads16: EnumThreadPoolConfig
end
declare class EnumThrottlingPriority extends EnumItem end
declare class EnumThrottlingPriority_INTERNAL extends Enum
	Extreme: EnumThrottlingPriority
	ElevatedOnServer: EnumThrottlingPriority
	Default: EnumThrottlingPriority
end
declare class EnumThumbnailSize extends EnumItem end
declare class EnumThumbnailSize_INTERNAL extends Enum
	Size48x48: EnumThumbnailSize
	Size180x180: EnumThumbnailSize
	Size420x420: EnumThumbnailSize
	Size60x60: EnumThumbnailSize
	Size100x100: EnumThumbnailSize
	Size150x150: EnumThumbnailSize
	Size352x352: EnumThumbnailSize
end
declare class EnumThumbnailType extends EnumItem end
declare class EnumThumbnailType_INTERNAL extends Enum
	HeadShot: EnumThumbnailType
	AvatarBust: EnumThumbnailType
	AvatarThumbnail: EnumThumbnailType
end
declare class EnumTickCountSampleMethod extends EnumItem end
declare class EnumTickCountSampleMethod_INTERNAL extends Enum
	Fast: EnumTickCountSampleMethod
	Benchmark: EnumTickCountSampleMethod
	Precise: EnumTickCountSampleMethod
end
declare class EnumTopBottom extends EnumItem end
declare class EnumTopBottom_INTERNAL extends Enum
	Top: EnumTopBottom
	Center: EnumTopBottom
	Bottom: EnumTopBottom
end
declare class EnumTouchCameraMovementMode extends EnumItem end
declare class EnumTouchCameraMovementMode_INTERNAL extends Enum
	Default: EnumTouchCameraMovementMode
	Follow: EnumTouchCameraMovementMode
	Classic: EnumTouchCameraMovementMode
	Orbital: EnumTouchCameraMovementMode
end
declare class EnumTouchMovementMode extends EnumItem end
declare class EnumTouchMovementMode_INTERNAL extends Enum
	Default: EnumTouchMovementMode
	Thumbstick: EnumTouchMovementMode
	DPad: EnumTouchMovementMode
	Thumbpad: EnumTouchMovementMode
	ClickToMove: EnumTouchMovementMode
	DynamicThumbstick: EnumTouchMovementMode
end
declare class EnumTrackerError extends EnumItem end
declare class EnumTrackerError_INTERNAL extends Enum
	Ok: EnumTrackerError
	NoService: EnumTrackerError
	InitFailed: EnumTrackerError
	NoVideo: EnumTrackerError
	VideoError: EnumTrackerError
	VideoNoPermission: EnumTrackerError
	VideoUnsupported: EnumTrackerError
	NoAudio: EnumTrackerError
	AudioError: EnumTrackerError
	AudioNoPermission: EnumTrackerError
	UnsupportedDevice: EnumTrackerError
end
declare class EnumTrackerExtrapolationFlagMode extends EnumItem end
declare class EnumTrackerExtrapolationFlagMode_INTERNAL extends Enum
	Auto: EnumTrackerExtrapolationFlagMode
	ForceDisabled: EnumTrackerExtrapolationFlagMode
	ExtrapolateFacsAndPose: EnumTrackerExtrapolationFlagMode
	ExtrapolateFacsOnly: EnumTrackerExtrapolationFlagMode
end
declare class EnumTrackerLodFlagMode extends EnumItem end
declare class EnumTrackerLodFlagMode_INTERNAL extends Enum
	Auto: EnumTrackerLodFlagMode
	ForceFalse: EnumTrackerLodFlagMode
	ForceTrue: EnumTrackerLodFlagMode
end
declare class EnumTrackerLodValueMode extends EnumItem end
declare class EnumTrackerLodValueMode_INTERNAL extends Enum
	Auto: EnumTrackerLodValueMode
	Force0: EnumTrackerLodValueMode
	Force1: EnumTrackerLodValueMode
end
declare class EnumTrackerMode extends EnumItem end
declare class EnumTrackerMode_INTERNAL extends Enum
	None: EnumTrackerMode
	Audio: EnumTrackerMode
	Video: EnumTrackerMode
	AudioVideo: EnumTrackerMode
end
declare class EnumTrackerPromptEvent extends EnumItem end
declare class EnumTrackerPromptEvent_INTERNAL extends Enum
	LODCameraRecommendDisable: EnumTrackerPromptEvent
end
declare class EnumTriStateBoolean extends EnumItem end
declare class EnumTriStateBoolean_INTERNAL extends Enum
	Unknown: EnumTriStateBoolean
	True: EnumTriStateBoolean
	False: EnumTriStateBoolean
end
declare class EnumTweenStatus extends EnumItem end
declare class EnumTweenStatus_INTERNAL extends Enum
	Canceled: EnumTweenStatus
	Completed: EnumTweenStatus
end
declare class EnumUITheme extends EnumItem end
declare class EnumUITheme_INTERNAL extends Enum
	Light: EnumUITheme
	Dark: EnumUITheme
end
declare class EnumUiMessageType extends EnumItem end
declare class EnumUiMessageType_INTERNAL extends Enum
	UiMessageError: EnumUiMessageType
	UiMessageInfo: EnumUiMessageType
end
declare class EnumUsageContext extends EnumItem end
declare class EnumUsageContext_INTERNAL extends Enum
	Default: EnumUsageContext
	Preview: EnumUsageContext
end
declare class EnumUserCFrame extends EnumItem end
declare class EnumUserCFrame_INTERNAL extends Enum
	Head: EnumUserCFrame
	LeftHand: EnumUserCFrame
	RightHand: EnumUserCFrame
	Floor: EnumUserCFrame
end
declare class EnumUserInputState extends EnumItem end
declare class EnumUserInputState_INTERNAL extends Enum
	Begin: EnumUserInputState
	Change: EnumUserInputState
	End: EnumUserInputState
	Cancel: EnumUserInputState
	None: EnumUserInputState
end
declare class EnumUserInputType extends EnumItem end
declare class EnumUserInputType_INTERNAL extends Enum
	MouseButton1: EnumUserInputType
	MouseButton2: EnumUserInputType
	MouseButton3: EnumUserInputType
	MouseWheel: EnumUserInputType
	MouseMovement: EnumUserInputType
	Touch: EnumUserInputType
	Keyboard: EnumUserInputType
	Focus: EnumUserInputType
	Accelerometer: EnumUserInputType
	Gyro: EnumUserInputType
	Gamepad1: EnumUserInputType
	Gamepad2: EnumUserInputType
	Gamepad3: EnumUserInputType
	Gamepad4: EnumUserInputType
	Gamepad5: EnumUserInputType
	Gamepad6: EnumUserInputType
	Gamepad7: EnumUserInputType
	Gamepad8: EnumUserInputType
	TextInput: EnumUserInputType
	InputMethod: EnumUserInputType
	None: EnumUserInputType
end
declare class EnumVelocityConstraintMode extends EnumItem end
declare class EnumVelocityConstraintMode_INTERNAL extends Enum
	Line: EnumVelocityConstraintMode
	Plane: EnumVelocityConstraintMode
	Vector: EnumVelocityConstraintMode
end
declare class EnumVerticalAlignment extends EnumItem end
declare class EnumVerticalAlignment_INTERNAL extends Enum
	Center: EnumVerticalAlignment
	Top: EnumVerticalAlignment
	Bottom: EnumVerticalAlignment
end
declare class EnumVerticalScrollBarPosition extends EnumItem end
declare class EnumVerticalScrollBarPosition_INTERNAL extends Enum
	Left: EnumVerticalScrollBarPosition
	Right: EnumVerticalScrollBarPosition
end
declare class EnumViewMode extends EnumItem end
declare class EnumViewMode_INTERNAL extends Enum
	None: EnumViewMode
	GeometryComplexity: EnumViewMode
	Transparent: EnumViewMode
	Decal: EnumViewMode
end
declare class EnumVirtualInputMode extends EnumItem end
declare class EnumVirtualInputMode_INTERNAL extends Enum
	Recording: EnumVirtualInputMode
	Playing: EnumVirtualInputMode
	None: EnumVirtualInputMode
end
declare class EnumVolumetricAudio extends EnumItem end
declare class EnumVolumetricAudio_INTERNAL extends Enum
	Disabled: EnumVolumetricAudio
	Automatic: EnumVolumetricAudio
	Enabled: EnumVolumetricAudio
end
declare class EnumWaterDirection extends EnumItem end
declare class EnumWaterDirection_INTERNAL extends Enum
	NegX: EnumWaterDirection
	X: EnumWaterDirection
	NegY: EnumWaterDirection
	Y: EnumWaterDirection
	NegZ: EnumWaterDirection
	Z: EnumWaterDirection
end
declare class EnumWaterForce extends EnumItem end
declare class EnumWaterForce_INTERNAL extends Enum
	None: EnumWaterForce
	Small: EnumWaterForce
	Medium: EnumWaterForce
	Strong: EnumWaterForce
	Max: EnumWaterForce
end
declare class EnumWrapLayerAutoSkin extends EnumItem end
declare class EnumWrapLayerAutoSkin_INTERNAL extends Enum
	Disabled: EnumWrapLayerAutoSkin
	EnabledPreserve: EnumWrapLayerAutoSkin
	EnabledOverride: EnumWrapLayerAutoSkin
end
declare class EnumWrapLayerDebugMode extends EnumItem end
declare class EnumWrapLayerDebugMode_INTERNAL extends Enum
	None: EnumWrapLayerDebugMode
	BoundCage: EnumWrapLayerDebugMode
	LayerCage: EnumWrapLayerDebugMode
	BoundCageAndLinks: EnumWrapLayerDebugMode
	Reference: EnumWrapLayerDebugMode
	Rbf: EnumWrapLayerDebugMode
	OuterCage: EnumWrapLayerDebugMode
	ReferenceMeshAfterMorph: EnumWrapLayerDebugMode
	HSROuterDetail: EnumWrapLayerDebugMode
	HSROuter: EnumWrapLayerDebugMode
	HSRInner: EnumWrapLayerDebugMode
	HSRInnerReverse: EnumWrapLayerDebugMode
	LayerCageFittedToBase: EnumWrapLayerDebugMode
	LayerCageFittedToPrev: EnumWrapLayerDebugMode
end
declare class EnumWrapTargetDebugMode extends EnumItem end
declare class EnumWrapTargetDebugMode_INTERNAL extends Enum
	None: EnumWrapTargetDebugMode
	TargetCageOriginal: EnumWrapTargetDebugMode
	TargetCageCompressed: EnumWrapTargetDebugMode
	TargetCageInterface: EnumWrapTargetDebugMode
	TargetLayerCageOriginal: EnumWrapTargetDebugMode
	TargetLayerCageCompressed: EnumWrapTargetDebugMode
	TargetLayerInterface: EnumWrapTargetDebugMode
	Rbf: EnumWrapTargetDebugMode
	OuterCageDetail: EnumWrapTargetDebugMode
end
declare class EnumZIndexBehavior extends EnumItem end
declare class EnumZIndexBehavior_INTERNAL extends Enum
	Global: EnumZIndexBehavior
	Sibling: EnumZIndexBehavior
end




declare class EnumUploadSetting extends EnumItem end
declare class EnumUploadSetting_INTERNAL extends Enum
	Never: EnumUploadSetting
	["Ask me first"]: EnumUploadSetting
end

declare class EnumPhysicsSendMethod extends EnumItem end
declare class EnumPhysicsSendMethod_INTERNAL extends Enum
	ErrorComputation2: EnumPhysicsSendMethod
end

declare class EnumPriorityMethod extends EnumItem end
declare class EnumPriorityMethod_INTERNAL extends Enum
	AccumulatedError: EnumPriorityMethod
end

type ENUM_LIST = {
	ActionType: EnumActionType_INTERNAL,
	ActuatorRelativeTo: EnumActuatorRelativeTo_INTERNAL,
	ActuatorType: EnumActuatorType_INTERNAL,
	AdShape: EnumAdShape_INTERNAL,
	AdTeleportMethod: EnumAdTeleportMethod_INTERNAL,
	AdUnitStatus: EnumAdUnitStatus_INTERNAL,
	AdornCullingMode: EnumAdornCullingMode_INTERNAL,
	AlphaMode: EnumAlphaMode_INTERNAL,
	AnalyticsLogLevel: EnumAnalyticsLogLevel_INTERNAL,
	AnalyticsProgressionStatus: EnumAnalyticsProgressionStatus_INTERNAL,
	AnimationPriority: EnumAnimationPriority_INTERNAL,
	AnimatorRetargetingMode: EnumAnimatorRetargetingMode_INTERNAL,
	AppShellActionType: EnumAppShellActionType_INTERNAL,
	AppShellFeature: EnumAppShellFeature_INTERNAL,
	AppUpdateStatus: EnumAppUpdateStatus_INTERNAL,
	ApplyStrokeMode: EnumApplyStrokeMode_INTERNAL,
	AspectType: EnumAspectType_INTERNAL,
	AssetFetchStatus: EnumAssetFetchStatus_INTERNAL,
	AudioWindowSize: EnumAudioWindowSize_INTERNAL,
	AutoIndentRule: EnumAutoIndentRule_INTERNAL,
	AutomaticSize: EnumAutomaticSize_INTERNAL,
	Axis: EnumAxis_INTERNAL,
	BinType: EnumBinType_INTERNAL,
	BodyPart: EnumBodyPart_INTERNAL,
	BorderMode: EnumBorderMode_INTERNAL,
	BreakpointRemoveReason: EnumBreakpointRemoveReason_INTERNAL,
	BulkMoveMode: EnumBulkMoveMode_INTERNAL,
	BundleType: EnumBundleType_INTERNAL,
	Button: EnumButton_INTERNAL,
	ButtonStyle: EnumButtonStyle_INTERNAL,
	CageType: EnumCageType_INTERNAL,
	CameraMode: EnumCameraMode_INTERNAL,
	CameraPanMode: EnumCameraPanMode_INTERNAL,
	CameraType: EnumCameraType_INTERNAL,
	CatalogCategoryFilter: EnumCatalogCategoryFilter_INTERNAL,
	CatalogSortAggregation: EnumCatalogSortAggregation_INTERNAL,
	CatalogSortType: EnumCatalogSortType_INTERNAL,
	CellBlock: EnumCellBlock_INTERNAL,
	CellMaterial: EnumCellMaterial_INTERNAL,
	CellOrientation: EnumCellOrientation_INTERNAL,
	CenterDialogType: EnumCenterDialogType_INTERNAL,
	ChatCallbackType: EnumChatCallbackType_INTERNAL,
	ChatColor: EnumChatColor_INTERNAL,
	ChatMode: EnumChatMode_INTERNAL,
	ChatPrivacyMode: EnumChatPrivacyMode_INTERNAL,
	ChatStyle: EnumChatStyle_INTERNAL,
	CommandPermission: EnumCommandPermission_INTERNAL,
	CompletionTriggerKind: EnumCompletionTriggerKind_INTERNAL,
	ComputerCameraMovementMode: EnumComputerCameraMovementMode_INTERNAL,
	ComputerMovementMode: EnumComputerMovementMode_INTERNAL,
	ConnectionState: EnumConnectionState_INTERNAL,
	ContextActionPriority: EnumContextActionPriority_INTERNAL,
	ContextActionResult: EnumContextActionResult_INTERNAL,
	ControlMode: EnumControlMode_INTERNAL,
	CoreGuiType: EnumCoreGuiType_INTERNAL,
	CreatorType: EnumCreatorType_INTERNAL,
	CreatorTypeFilter: EnumCreatorTypeFilter_INTERNAL,
	CurrencyType: EnumCurrencyType_INTERNAL,
	CustomCameraMode: EnumCustomCameraMode_INTERNAL,
	DebuggerEndReason: EnumDebuggerEndReason_INTERNAL,
	DebuggerExceptionBreakMode: EnumDebuggerExceptionBreakMode_INTERNAL,
	DebuggerFrameType: EnumDebuggerFrameType_INTERNAL,
	DebuggerPauseReason: EnumDebuggerPauseReason_INTERNAL,
	DebuggerStatus: EnumDebuggerStatus_INTERNAL,
	DevCameraOcclusionMode: EnumDevCameraOcclusionMode_INTERNAL,
	DevComputerCameraMovementMode: EnumDevComputerCameraMovementMode_INTERNAL,
	DevComputerMovementMode: EnumDevComputerMovementMode_INTERNAL,
	DevTouchCameraMovementMode: EnumDevTouchCameraMovementMode_INTERNAL,
	DevTouchMovementMode: EnumDevTouchMovementMode_INTERNAL,
	DeveloperMemoryTag: EnumDeveloperMemoryTag_INTERNAL,
	DeviceType: EnumDeviceType_INTERNAL,
	DialogBehaviorType: EnumDialogBehaviorType_INTERNAL,
	DialogPurpose: EnumDialogPurpose_INTERNAL,
	DialogTone: EnumDialogTone_INTERNAL,
	DominantAxis: EnumDominantAxis_INTERNAL,
	DraftStatusCode: EnumDraftStatusCode_INTERNAL,
	DragDetectorDragStyle: EnumDragDetectorDragStyle_INTERNAL,
	DragDetectorResponseStyle: EnumDragDetectorResponseStyle_INTERNAL,
	DraggerCoordinateSpace: EnumDraggerCoordinateSpace_INTERNAL,
	DraggerMovementMode: EnumDraggerMovementMode_INTERNAL,
	EasingDirection: EnumEasingDirection_INTERNAL,
	EasingStyle: EnumEasingStyle_INTERNAL,
	ElasticBehavior: EnumElasticBehavior_INTERNAL,
	EnviromentalPhysicsThrottle: EnumEnviromentalPhysicsThrottle_INTERNAL,
	ExplosionType: EnumExplosionType_INTERNAL,
	FacialAnimationStreamingState: EnumFacialAnimationStreamingState_INTERNAL,
	FieldOfViewMode: EnumFieldOfViewMode_INTERNAL,
	FillDirection: EnumFillDirection_INTERNAL,
	FilterResult: EnumFilterResult_INTERNAL,
	FinishRecordingOperation: EnumFinishRecordingOperation_INTERNAL,
	FluidForces: EnumFluidForces_INTERNAL,
	Font: EnumFont_INTERNAL,
	FontSize: EnumFontSize_INTERNAL,
	FontStyle: EnumFontStyle_INTERNAL,
	FontWeight: EnumFontWeight_INTERNAL,
	ForceLimitMode: EnumForceLimitMode_INTERNAL,
	FormFactor: EnumFormFactor_INTERNAL,
	FrameStyle: EnumFrameStyle_INTERNAL,
	FramerateManagerMode: EnumFramerateManagerMode_INTERNAL,
	FriendRequestEvent: EnumFriendRequestEvent_INTERNAL,
	FriendStatus: EnumFriendStatus_INTERNAL,
	FunctionalTestResult: EnumFunctionalTestResult_INTERNAL,
	GearGenreSetting: EnumGearGenreSetting_INTERNAL,
	GearType: EnumGearType_INTERNAL,
	Genre: EnumGenre_INTERNAL,
	GraphicsMode: EnumGraphicsMode_INTERNAL,
	GuiState: EnumGuiState_INTERNAL,
	GuiType: EnumGuiType_INTERNAL,
	HandlesStyle: EnumHandlesStyle_INTERNAL,
	HighlightDepthMode: EnumHighlightDepthMode_INTERNAL,
	HorizontalAlignment: EnumHorizontalAlignment_INTERNAL,
	HoverAnimateSpeed: EnumHoverAnimateSpeed_INTERNAL,
	HttpCachePolicy: EnumHttpCachePolicy_INTERNAL,
	HttpContentType: EnumHttpContentType_INTERNAL,
	HttpError: EnumHttpError_INTERNAL,
	HumanoidCollisionType: EnumHumanoidCollisionType_INTERNAL,
	HumanoidDisplayDistanceType: EnumHumanoidDisplayDistanceType_INTERNAL,
	HumanoidHealthDisplayType: EnumHumanoidHealthDisplayType_INTERNAL,
	HumanoidOnlySetCollisionsOnStateChange: EnumHumanoidOnlySetCollisionsOnStateChange_INTERNAL,
	HumanoidStateType: EnumHumanoidStateType_INTERNAL,
	InOut: EnumInOut_INTERNAL,
	InfoType: EnumInfoType_INTERNAL,
	InitialDockState: EnumInitialDockState_INTERNAL,
	InputType: EnumInputType_INTERNAL,
	InterpolationThrottlingMode: EnumInterpolationThrottlingMode_INTERNAL,
	JointCreationMode: EnumJointCreationMode_INTERNAL,
	KeyInterpolationMode: EnumKeyInterpolationMode_INTERNAL,
	KeywordFilterType: EnumKeywordFilterType_INTERNAL,
	Language: EnumLanguage_INTERNAL,
	LeftRight: EnumLeftRight_INTERNAL,
	Limb: EnumLimb_INTERNAL,
	LineJoinMode: EnumLineJoinMode_INTERNAL,
	ListDisplayMode: EnumListDisplayMode_INTERNAL,
	ListenerType: EnumListenerType_INTERNAL,
	LoadCharacterLayeredClothing: EnumLoadCharacterLayeredClothing_INTERNAL,
	LoadDynamicHeads: EnumLoadDynamicHeads_INTERNAL,
	MarkupKind: EnumMarkupKind_INTERNAL,
	Material: EnumMaterial_INTERNAL,
	MaterialPattern: EnumMaterialPattern_INTERNAL,
	MembershipType: EnumMembershipType_INTERNAL,
	MeshPartDetailLevel: EnumMeshPartDetailLevel_INTERNAL,
	MeshPartHeadsAndAccessories: EnumMeshPartHeadsAndAccessories_INTERNAL,
	MeshScaleUnit: EnumMeshScaleUnit_INTERNAL,
	MeshType: EnumMeshType_INTERNAL,
	MessageType: EnumMessageType_INTERNAL,
	ModelLevelOfDetail: EnumModelLevelOfDetail_INTERNAL,
	MoveState: EnumMoveState_INTERNAL,
	NameOcclusion: EnumNameOcclusion_INTERNAL,
	NetworkOwnership: EnumNetworkOwnership_INTERNAL,
	NormalId: EnumNormalId_INTERNAL,
	OrientationAlignmentMode: EnumOrientationAlignmentMode_INTERNAL,
	OutfitSource: EnumOutfitSource_INTERNAL,
	OutfitType: EnumOutfitType_INTERNAL,
	OutputLayoutMode: EnumOutputLayoutMode_INTERNAL,
	PackagePermission: EnumPackagePermission_INTERNAL,
	PartType: EnumPartType_INTERNAL,
	ParticleOrientation: EnumParticleOrientation_INTERNAL,
	PathStatus: EnumPathStatus_INTERNAL,
	PathWaypointAction: EnumPathWaypointAction_INTERNAL,
	PermissionLevelShown: EnumPermissionLevelShown_INTERNAL,
	PhysicsSimulationRate: EnumPhysicsSimulationRate_INTERNAL,
	PhysicsSteppingMethod: EnumPhysicsSteppingMethod_INTERNAL,
	Platform: EnumPlatform_INTERNAL,
	PlaybackState: EnumPlaybackState_INTERNAL,
	PlayerActions: EnumPlayerActions_INTERNAL,
	PlayerChatType: EnumPlayerChatType_INTERNAL,
	PoseEasingDirection: EnumPoseEasingDirection_INTERNAL,
	PoseEasingStyle: EnumPoseEasingStyle_INTERNAL,
	PositionAlignmentMode: EnumPositionAlignmentMode_INTERNAL,
	PrivilegeType: EnumPrivilegeType_INTERNAL,
	ProductPurchaseDecision: EnumProductPurchaseDecision_INTERNAL,
	PromptCreateAssetResult: EnumPromptCreateAssetResult_INTERNAL,
	PromptPublishAssetResult: EnumPromptPublishAssetResult_INTERNAL,
	PropertyStatus: EnumPropertyStatus_INTERNAL,
	QualityLevel: EnumQualityLevel_INTERNAL,
	RaycastFilterType: EnumRaycastFilterType_INTERNAL,
	RenderFidelity: EnumRenderFidelity_INTERNAL,
	RenderPriority: EnumRenderPriority_INTERNAL,
	ReservedHighlightId: EnumReservedHighlightId_INTERNAL,
	ReturnKeyType: EnumReturnKeyType_INTERNAL,
	ReverbType: EnumReverbType_INTERNAL,
	RibbonTool: EnumRibbonTool_INTERNAL,
	RigScale: EnumRigScale_INTERNAL,
	RollOffMode: EnumRollOffMode_INTERNAL,
	RotationOrder: EnumRotationOrder_INTERNAL,
	RotationType: EnumRotationType_INTERNAL,
	RtlTextSupport: EnumRtlTextSupport_INTERNAL,
	RunContext: EnumRunContext_INTERNAL,
	RuntimeUndoBehavior: EnumRuntimeUndoBehavior_INTERNAL,
	SafeAreaCompatibility: EnumSafeAreaCompatibility_INTERNAL,
	SalesTypeFilter: EnumSalesTypeFilter_INTERNAL,
	SaveAvatarThumbnailCustomizationFailure: EnumSaveAvatarThumbnailCustomizationFailure_INTERNAL,
	SaveFilter: EnumSaveFilter_INTERNAL,
	SavedQualitySetting: EnumSavedQualitySetting_INTERNAL,
	ScopeCheckResult: EnumScopeCheckResult_INTERNAL,
	ScrollBarInset: EnumScrollBarInset_INTERNAL,
	ScrollingDirection: EnumScrollingDirection_INTERNAL,
	SelectionBehavior: EnumSelectionBehavior_INTERNAL,
	SelectionRenderMode: EnumSelectionRenderMode_INTERNAL,
	ServiceVisibility: EnumServiceVisibility_INTERNAL,
	Severity: EnumSeverity_INTERNAL,
	SignalBehavior: EnumSignalBehavior_INTERNAL,
	SizeConstraint: EnumSizeConstraint_INTERNAL,
	SolverConvergenceVisualizationMode: EnumSolverConvergenceVisualizationMode_INTERNAL,
	SortOrder: EnumSortOrder_INTERNAL,
	SpecialKey: EnumSpecialKey_INTERNAL,
	StartCorner: EnumStartCorner_INTERNAL,
	Status: EnumStatus_INTERNAL,
	StreamOutBehavior: EnumStreamOutBehavior_INTERNAL,
	StreamingIntegrityMode: EnumStreamingIntegrityMode_INTERNAL,
	StreamingPauseMode: EnumStreamingPauseMode_INTERNAL,
	StudioCloseMode: EnumStudioCloseMode_INTERNAL,
	StudioStyleGuideModifier: EnumStudioStyleGuideModifier_INTERNAL,
	Style: EnumStyle_INTERNAL,
	SurfaceConstraint: EnumSurfaceConstraint_INTERNAL,
	SurfaceGuiShape: EnumSurfaceGuiShape_INTERNAL,
	SurfaceGuiSizingMode: EnumSurfaceGuiSizingMode_INTERNAL,
	SurfaceType: EnumSurfaceType_INTERNAL,
	SwipeDirection: EnumSwipeDirection_INTERNAL,
	TableMajorAxis: EnumTableMajorAxis_INTERNAL,
	Technology: EnumTechnology_INTERNAL,
	TeleportMethod: EnumTeleportMethod_INTERNAL,
	TeleportResult: EnumTeleportResult_INTERNAL,
	TeleportState: EnumTeleportState_INTERNAL,
	TeleportType: EnumTeleportType_INTERNAL,
	TextFilterContext: EnumTextFilterContext_INTERNAL,
	TextInputType: EnumTextInputType_INTERNAL,
	TextTruncate: EnumTextTruncate_INTERNAL,
	TextXAlignment: EnumTextXAlignment_INTERNAL,
	TextYAlignment: EnumTextYAlignment_INTERNAL,
	TextureMode: EnumTextureMode_INTERNAL,
	TextureQueryType: EnumTextureQueryType_INTERNAL,
	ThreadPoolConfig: EnumThreadPoolConfig_INTERNAL,
	ThrottlingPriority: EnumThrottlingPriority_INTERNAL,
	ThumbnailSize: EnumThumbnailSize_INTERNAL,
	ThumbnailType: EnumThumbnailType_INTERNAL,
	TickCountSampleMethod: EnumTickCountSampleMethod_INTERNAL,
	TopBottom: EnumTopBottom_INTERNAL,
	TouchCameraMovementMode: EnumTouchCameraMovementMode_INTERNAL,
	TouchMovementMode: EnumTouchMovementMode_INTERNAL,
	TrackerError: EnumTrackerError_INTERNAL,
	TrackerExtrapolationFlagMode: EnumTrackerExtrapolationFlagMode_INTERNAL,
	TrackerLodFlagMode: EnumTrackerLodFlagMode_INTERNAL,
	TrackerLodValueMode: EnumTrackerLodValueMode_INTERNAL,
	TrackerMode: EnumTrackerMode_INTERNAL,
	TrackerPromptEvent: EnumTrackerPromptEvent_INTERNAL,
	TriStateBoolean: EnumTriStateBoolean_INTERNAL,
	TweenStatus: EnumTweenStatus_INTERNAL,
	UITheme: EnumUITheme_INTERNAL,
	UiMessageType: EnumUiMessageType_INTERNAL,
	UsageContext: EnumUsageContext_INTERNAL,
	UserCFrame: EnumUserCFrame_INTERNAL,
	UserInputState: EnumUserInputState_INTERNAL,
	UserInputType: EnumUserInputType_INTERNAL,
	VelocityConstraintMode: EnumVelocityConstraintMode_INTERNAL,
	VerticalAlignment: EnumVerticalAlignment_INTERNAL,
	VerticalScrollBarPosition: EnumVerticalScrollBarPosition_INTERNAL,
	ViewMode: EnumViewMode_INTERNAL,
	VirtualInputMode: EnumVirtualInputMode_INTERNAL,
	VolumetricAudio: EnumVolumetricAudio_INTERNAL,
	WaterDirection: EnumWaterDirection_INTERNAL,
	WaterForce: EnumWaterForce_INTERNAL,
	WrapLayerAutoSkin: EnumWrapLayerAutoSkin_INTERNAL,
	WrapLayerDebugMode: EnumWrapLayerDebugMode_INTERNAL,
	WrapTargetDebugMode: EnumWrapTargetDebugMode_INTERNAL,
	ZIndexBehavior: EnumZIndexBehavior_INTERNAL,

	UploadSetting: EnumUploadSetting_INTERNAL,
	PhysicsSendMethod: EnumPhysicsSendMethod_INTERNAL,
	PriorityMethod: EnumPriorityMethod_INTERNAL,

} & { GetEnums: (self: ENUM_LIST) -> { Enum } }
declare Enum: ENUM_LIST

declare class Axes
	Back: boolean
	Bottom: boolean
	Front: boolean
	Left: boolean
	Right: boolean
	Top: boolean
	X: boolean
	Y: boolean
	Z: boolean
end

declare class CatalogSearchParams
	BundleType: { EnumBundleType }
	CategoryFilter: EnumCatalogCategoryFilter
	MaxPrice: number
	MinPrice: number
	SearchKeyword: string
	SortType: EnumCatalogSortType
end

declare class Color3
	b: number
	g: number
	r: number
	function Lerp(self, color: Color3, alpha: number): Color3
	function ToHSV(self): (number, number, number)
	function ToHex(self): string
end

declare class BrickColor
	Color: Color3
	Name: string
	Number: number
	b: number
	g: number
	r: number
end

declare class ColorSequenceKeypoint
	Time: number
	Value: Color3
end

declare class ColorSequence
	Keypoints: { ColorSequenceKeypoint }
end

declare class DateTime
	UnixTimestamp: number
	UnixTimestampMillis: number
	function FormatLocalTime(self, format: string, locale: string): string
	function FormatUniversalTime(self, format: string, locale: string): string
	function ToIsoDate(self): string
	function ToLocalTime(self): { any }
	function ToUniversalTime(self): { any }
end





declare class Enums
	function GetEnums(self): { Enum }
end

declare class Faces
	Back: boolean
	Bottom: boolean
	Front: boolean
	Left: boolean
	Right: boolean
	Top: boolean
end

declare class Font
	Bold: boolean
	Family: string
	Style: EnumFontStyle
	Weight: EnumFontWeight
end

declare class NumberRange
	Max: number
	Min: number
end

declare class NumberSequenceKeypoint
	Envelope: number
	Time: number
	Value: number
end

declare class NumberSequence
	Keypoints: { NumberSequenceKeypoint }
end

declare class OverlapParams
	CollisionGroup: string
	FilterDescendantsInstances: { Instance }
	FilterType: EnumRaycastFilterType
	MaxParts: number
	RespectCanCollide: boolean
end

declare class PhysicalProperties
	Density: number
	Elasticity: number
	ElasticityWeight: number
	Friction: number
	FrictionWeight: number
end

declare class RBXScriptConnection
	connected: boolean
	function disconnect(self): nil
end



declare class RaycastParams
	CollisionGroup: string
	FilterDescendantsInstances: { Instance }
	FilterType: EnumRaycastFilterType
	IgnoreWater: boolean
	RespectCanCollide: boolean
end

declare class UDim
	Offset: number
	Scale: number
	function __add(self, other: UDim): UDim
	function __sub(self, other: UDim): UDim
	function __unm(self): UDim
end

declare class UDim2
	Height: UDim
	Width: UDim
	X: UDim
	Y: UDim
	function Lerp(self, goal: UDim2, alpha: number): UDim2
	function __add(self, other: UDim2): UDim2
	function __sub(self, other: UDim2): UDim2
	function __unm(self): UDim2
end

declare class Vector2
	Magnitude: number
	magnitude: number
	Unit: Vector2
	unit: Vector2
	X: number
	Y: number
	x: number
	y: number
	function Cross(self, other: Vector2): number
	function Dot(self, v: Vector2): number
	function Lerp(self, v: Vector2, alpha: number): Vector2
	function __add(self, other: Vector2): Vector2
	function __div(self, other: Vector2 | number): Vector2
	function __mul(self, other: Vector2 | number): Vector2
	function __sub(self, other: Vector2): Vector2
	function __unm(self): Vector2
end

declare class Rect
	Height: number
	Max: Vector2
	Min: Vector2
	Width: number
end

declare class Vector2int16
	X: number
	Y: number
	function __add(self, other: Vector2int16): Vector2int16
	function __div(self, other: Vector2int16 | number): Vector2int16
	function __mul(self, other: Vector2int16 | number): Vector2int16
	function __sub(self, other: Vector2int16): Vector2int16
	function __unm(self): Vector2int16
end

declare class Vector3
	Magnitude: number
	magnitude: number
	Unit: Vector3
	unit: Vector3
	X: number
	x: number
	Y: number
	y: number
	Z: number
	z: number
	function Angle(self, other: Vector3, axis: Vector3?): number
	function Cross(self, other: Vector3): Vector3
	function Dot(self, other: Vector3): number
	function FuzzyEq(self, other: Vector3, epsilon: number): boolean
	function Lerp(self, goal: Vector3, alpha: number): Vector3
	function __add(self, other: Vector3): Vector3
	function __div(self, other: Vector3 | number): Vector3
	function __mul(self, other: Vector3 | number): Vector3
	function __sub(self, other: Vector3): Vector3
	function __unm(self): Vector3
end

declare class RaycastResult
	Distance: number
	Instance: Instance
	Material: EnumMaterial
	Normal: Vector3
	Position: Vector3
end

declare class Ray
	Direction: Vector3
	Origin: Vector3
	Unit: Ray
	function ClosestPoint(self, point: Vector3): Vector3
	function Distance(self, point: Vector3): number
end

declare class Random
	function Clone(self): Random
	function NextInteger(self, min: number, max: number): number
	function NextNumber(self): number
	function NextNumber(self, min: number, max: number): number
	function NextUnitVector(self): Vector3
end

declare class PathWaypoint
	Action: EnumPathWaypointAction
	Position: Vector3
end

declare class CFrame
	lookVector: Vector3
	p: Vector3
	X: number
	Y: number
	Z: number
	function inverse(self): CFrame
	function pointToObjectSpace(self, v3: Vector3): Vector3
	function pointToWorldSpace(self, v3: Vector3): Vector3
	function toEulerAnglesXYZ(self): (number, number, number)
	function toObjectSpace(self, cf: CFrame): CFrame
	function toWorldSpace(self, cf: CFrame): CFrame
	function vectorToObjectSpace(self, v3: Vector3): Vector3
	function vectorToWorldSpace(self, v3: Vector3): Vector3
	function __add(self, other: Vector3): CFrame
	function __mul(self, other: CFrame): CFrame
	function __mul(self, other: Vector3): Vector3
	function __sub(self, other: Vector3): CFrame
end

declare class Region3
	CFrame: CFrame
	Size: Vector3
	function ExpandToGrid(self, Region: number): Region3
end

declare class Vector3int16
	X: number
	Y: number
	Z: number
	function __add(self, other: Vector3int16): Vector3int16
	function __div(self, other: Vector3int16 | number): Vector3int16
	function __mul(self, other: Vector3int16 | number): Vector3int16
	function __sub(self, other: Vector3int16): Vector3int16
	function __unm(self): Vector3int16
end

declare class Region3int16
	Max: Vector3int16
	Min: Vector3int16
end


export type SharedTable = any
export type OpenCloudModel = any

export type RBXScriptSignal<T... = ...any> = {
    wait: (self: RBXScriptSignal<T...>, time: number?) -> T...,
    connect: (self: RBXScriptSignal<T...>, callback: (T...) -> ()) -> RBXScriptConnection,
    connectParallel: (self: RBXScriptSignal<T...>, callback: (T...) -> ()) -> RBXScriptConnection,
    once: (self: RBXScriptSignal<T...>, callback: (T...) -> ()) -> RBXScriptConnection,
}

type HttpRequestOptions = {
    Url: string,
    Method: "GET" | "HEAD" | "POST" | "PUT" | "DELETE" | "CONNECT" | "OPTIONS" | "TRACE" | "PATCH" | nil,
    Headers: { [string]: string }?,
    Body: string?,
}

type HttpResponseData = {
    Success: boolean,
    StatusCode: number,
    StatusMessage: string,
    Headers: { [string]: string },
    Body: string?,
}

type Hat = any
type RocketPropulsion = any
type Skin = any
type CustomEvent = any
type CustomEventReceiver = any
type BevelMesh = any
type CylinderMesh = any
type Hole = any
type MotorFeature = any
type FunctionalTest = any
type GuiMain = any
type FloorWire = any
type SelectionPartLasso = any
type SelectionPointLasso = any
type Hopper = any
type RotateP = any
type RotateV = any
type Glue = any
type ManualSurfaceJointInstance = any
type ManualGlue = any
type ManualWeld = any
type Rotate = any
type Snap = any
type JointsService = any
type Message = any
type Hint = any
type FlagStand = any
type SkateboardPlatform = any
type HopperBin = any
type Flag = any
type Status = any
type PointsService = any
type DoubleConstrainedValue = any
type IntConstrainedValue = any

declare class Instance
	AncestryChanged: RBXScriptSignal<Instance, Instance?>
	Archivable: boolean
	AttributeChanged: RBXScriptSignal<string>
	Changed: RBXScriptSignal<string>
	ChildAdded: RBXScriptSignal<Instance>
	ChildRemoved: RBXScriptSignal<Instance>
	ClassName: string
	DescendantAdded: RBXScriptSignal<Instance>
	DescendantRemoving: RBXScriptSignal<Instance>
	Name: string
	Parent: Instance?
	RobloxLocked: boolean
	SourceAssetId: number

	VideoRecordingChangeRequest: RBXScriptSignal<any> -- lmao okay then

	function ClearAllChildren(self): nil
	function Clone(self): Instance
	function Destroy(self): nil
	function Remove(self): nil
	function FindFirstChild(self, name: string, recursive: boolean?): Instance?
	function FindFirstDescendant(self, name: string): Instance?
	function GetChildren(self): { Instance }
	function GetDebugId(self, scopeLength: number?): string
	function GetFullName(self): string
	function IsA(self, className: string): boolean
	function IsAncestorOf(self, descendant: Instance): boolean
	function IsDescendantOf(self, ancestor: Instance): boolean
	function WaitForChild(self, name: string): Instance
	function WaitForChild(self, name: string, timeout: number): Instance?
end

declare class Accoutrement extends Instance
	AttachmentForward: Vector3
	AttachmentPoint: CFrame
	AttachmentPos: Vector3
	AttachmentRight: Vector3
	AttachmentUp: Vector3
end

declare class AdvancedDragger extends Instance
end

declare class Animation extends Instance
	AnimationId: Content
end

declare class AnimationClip extends Instance
	Guid: string
	Loop: boolean
	Priority: EnumAnimationPriority
end

declare class CurveAnimation extends AnimationClip
end

declare class KeyframeSequence extends AnimationClip
	AuthoredHipHeight: number
	function AddKeyframe(self, keyframe: Keyframe): nil
	function GetKeyframes(self): { Instance }
	function RemoveKeyframe(self, keyframe: Keyframe): nil
end

declare class AnimationClipProvider extends Instance
	function GetAnimationClipAsync(self, assetId: Content): AnimationClip
	function GetAnimations(self, userId: number): Instance
	function GetMemStats(self): { [any]: any }
	function RegisterActiveAnimationClip(self, animationClip: AnimationClip): Content
	function RegisterAnimationClip(self, animationClip: AnimationClip): Content
end

declare class AnimationController extends Instance
end

declare class AnimationTrack extends Instance
	Animation: Animation
	DidLoop: RBXScriptSignal<>
	Ended: RBXScriptSignal<>
	IsPlaying: boolean
	KeyframeReached: RBXScriptSignal<string>
	Length: number
	Looped: boolean
	Priority: EnumAnimationPriority
	Speed: number
	Stopped: RBXScriptSignal<>
	TimePosition: number
	WeightCurrent: number
	WeightTarget: number
	function AdjustSpeed(self, speed: number?): nil
	function AdjustWeight(self, weight: number?, fadeTime: number?): nil
	function GetMarkerReachedSignal(self, name: string): RBXScriptSignal
	function GetTimeOfKeyframe(self, keyframeName: string): number
	function Play(self, fadeTime: number?, weight: number?, speed: number?): nil
	function Stop(self, fadeTime: number?): nil
end

declare class Animator extends Instance
	function GetPlayingAnimationTracks(self): { AnimationTrack }
	function GetPlayingAnimationTracksCoreScript(self): { any }
	function LoadAnimation(self, animation: Animation): AnimationTrack
	function StepAnimations(self, deltaTime: number): nil
end

declare class AppUpdateService extends Instance
	function CheckForUpdate(self, handler: ((...any) -> ...any)?): nil
	function DisableDUAR(self): nil
	function DisableDUARAndOpenSurvey(self, surveyUrl: string): nil
	function PerformManagedUpdate(self): boolean
end

declare class AssetCounterService extends Instance
end

declare class AssetDeliveryProxy extends Instance
	Interface: string
	Port: number
	StartServer: boolean
end

declare class AssetPatchSettings extends Instance
	ContentId: string
	OutputPath: string
	PatchId: string
end

declare class AssetService extends Instance
	function GetAssetVersions(self, placeId: number, pageNum: number): { any }
	function GetPlacePermissions(self, placeId: number): { any }
	function RevertAsset(self, placeId: number, versionNumber: number): boolean
	function SetAssetRevertUrl(self, revertUrl: string): nil
	function SetAssetVersionsUrl(self, versionsUrl: string): nil
	function SetPlaceAccessUrl(self, accessUrl: string): boolean
	function SetPlacePermissions(self, placeId: number, accessType: any --[[EnumAccessType]], inviteList: { any }): boolean
end

declare class Backpack extends Instance
	function SetOldSchoolBackpack(self, enabled: boolean): nil
end

declare class BadgeService extends Instance
	BadgeAwarded: RBXScriptSignal<string, number, number>
	OnBadgeAwarded: RBXScriptSignal<number, number, number>
	function AwardBadge(self, userId: number, badgeId: number): boolean
	function GetBadgeInfoAsync(self, badgeId: number): { [any]: any }
	function UserHasBadgeAsync(self, userId: number, badgeId: number): boolean
end

declare class BaseImportData extends Instance
	Id: string
	ImportName: string
	ShouldImport: boolean
	function CreateTemplateFromData(self): { [any]: any }
	function GetStatuses(self): { [any]: any }
end

declare class AnimationImportData extends BaseImportData
end

declare class FacsImportData extends BaseImportData
end

declare class GroupImportData extends BaseImportData
	Anchored: boolean
	ImportAsModelAsset: boolean
	InsertInWorkspace: boolean
end

declare class JointImportData extends BaseImportData
end

declare class MaterialImportData extends BaseImportData
	DiffuseFilePath: string
	IsPbr: boolean
	MetalnessFilePath: string
	NormalFilePath: string
	RoughnessFilePath: string
end

declare class MeshImportData extends BaseImportData
	Anchored: boolean
	CageManifold: boolean
	CageMeshIntersectedPreview: boolean
	CageMeshNotIntersected: boolean
	CageNoOverlappingVertices: boolean
	CageNonManifoldPreview: boolean
	CageOverlappingVerticesPreview: boolean
	CageUVMatched: boolean
	CageUVMisMatchedPreview: boolean
	Dimensions: Vector3
	DoubleSided: boolean
	IgnoreVertexColors: boolean
	IrrelevantCageModifiedPreview: boolean
	MeshHoleDetectedPreview: boolean
	MeshNoHoleDetected: boolean
	NoIrrelevantCageModified: boolean
	NoOuterCageFarExtendedFromMesh: boolean
	OuterCageFarExtendedFromMeshPreview: boolean
	PolygonCount: number
	UseImportedPivot: boolean
end

declare class BasePlayerGui extends Instance
	function GetGuiObjectsAtPosition(self, x: number, y: number): { GuiObject }
	function GetGuiObjectsInCircle(self, position: Vector2, radius: number): { GuiObject }
end

declare class CoreGui extends BasePlayerGui
	Version: number
	RobloxGui: ScreenGui -- graaah
end

declare class PlayerGui extends BasePlayerGui
end

declare class StarterGui extends BasePlayerGui
	CoreGuiChangedSignal: RBXScriptSignal<EnumCoreGuiType, boolean>
	ProcessUserInput: boolean
	ShowDevelopmentGui: boolean
	function GetCoreGuiEnabled(self, coreGuiType: EnumCoreGuiType): boolean
	function SetCoreGuiEnabled(self, coreGuiType: EnumCoreGuiType, enabled: boolean): nil
end

declare class BindableEvent extends Instance
	Event: RBXScriptSignal<...any>
	function Fire(self, ...: any): ()
end

declare class BindableFunction extends Instance
	OnInvoke: (...any) -> ...any
	function Invoke(self, ...: any): ...any
end

declare class BodyMover extends Instance
end

declare class BodyAngularVelocity extends BodyMover
	AngularVelocity: Vector3
	MaxTorque: Vector3
	P: number
end

declare class BodyForce extends BodyMover
	force: Vector3
end

declare class BodyGyro extends BodyMover
	CFrame: CFrame
	D: number
	MaxTorque: Vector3
	P: number
end

declare class BodyPosition extends BodyMover
	D: number
	MaxForce: Vector3
	P: number
	Position: Vector3
	ReachedTarget: RBXScriptSignal<>
	function GetLastForce(self): Vector3
end

declare class BodyThrust extends BodyMover
	Force: Vector3
	Location: Vector3
end

declare class BodyVelocity extends BodyMover
	MaxForce: Vector3
	P: number
	Velocity: Vector3
	function GetLastForce(self): Vector3
	function lastForce(self): Vector3
end

declare class BrowserService extends Instance
	AuthCookieCopiedToEngine: RBXScriptSignal<>
	BrowserWindowClosed: RBXScriptSignal<>
	BrowserWindowWillNavigate: RBXScriptSignal<string>
	JavaScriptCallback: RBXScriptSignal<string>
	function CloseBrowserWindow(self): nil
	function CopyAuthCookieFromBrowserToEngine(self): nil
	function EmitHybridEvent(self, moduleName: string, eventName: string, params: string): nil
	function ExecuteJavaScript(self, javascript: string): nil
	function OpenBrowserWindow(self, url: string): nil
	function OpenNativeOverlay(self, title: string, url: string): nil
	function OpenWeChatAuthWindow(self): nil
	function ReturnToJavaScript(self, callbackId: string, success: boolean, params: string): nil
	function SendCommand(self, command: string): nil
end

declare class BubbleChatMessageProperties extends Instance
	BackgroundColor3: Color3
	BackgroundTransparency: number
	FontFace: Font
	TextColor3: Color3
	TextSize: number
end

declare class BulkImportService extends Instance
	BulkImportFinished: RBXScriptSignal<number>
	BulkImportStarted: RBXScriptSignal<>
	function LaunchBulkImport(self, assetTypeToImport: number): nil
	function ShowBulkImportView(self): nil
end

declare class CacheableContentProvider extends Instance
end

declare class HSRDataContentProvider extends CacheableContentProvider
end

declare class MeshContentProvider extends CacheableContentProvider
	function GetContentMemoryData(self): { [any]: any }
end

declare class CalloutService extends Instance
	function AttachCallout(self, definitionId: string, locationId: string, target: Instance): nil
	function DefineCallout(self, definitionId: string, title: string, description: string, learnMoreURL: string): nil
	function DetachCalloutsByDefinitionId(self, definitionId: string): nil
end

declare class Camera extends Instance
	CoordinateFrame: CFrame
	CameraSubject: Humanoid | BasePart | nil
	CameraType: EnumCameraType
	DiagonalFieldOfView: number
	FieldOfView: number
	FieldOfViewMode: EnumFieldOfViewMode
	FirstPersonTransition: RBXScriptSignal<boolean>
	Focus: CFrame
	HeadScale: number
	InterpolationFinished: RBXScriptSignal<>
	ViewportSize: Vector2
	function GetRoll(self): number
	function SetCameraPanMode(self, mode: EnumCameraPanMode?): nil
	function SetImageServerView(self, modelCoord: CFrame): nil
	function SetRoll(self, rollAngle: number): nil
	function ViewportPointToRay(self, x: number, y: number, depth: number?): Ray
	function WorldToScreenPoint(self, worldPoint: Vector3): (Vector3, boolean)
	function WorldToViewportPoint(self, worldPoint: Vector3): (Vector3, boolean)
	function Zoom(self, distance: number): boolean
end

declare class CaptureService extends Instance
	CaptureSaved: RBXScriptSignal<{ [any]: any }>
	function GetCaptureSizeAsync(self, captureContentId: Content): Vector2
	function RetrieveCaptures(self): { any }
	function SaveScreenshotCapture(self): nil
end

declare class ChangeHistoryService extends Instance
	OnRecordingFinished: RBXScriptSignal<string, string?, string?, EnumFinishRecordingOperation, { [any]: any }?>
	OnRecordingStarted: RBXScriptSignal<string, string?>
	OnRedo: RBXScriptSignal<string>
	OnUndo: RBXScriptSignal<string>
	function FinishRecording(self, identifier: string, operation: EnumFinishRecordingOperation, finalOptions: { [any]: any }?): nil
	function GetCanRedo(self): any
	function GetCanUndo(self): any
	function IsRecordingInProgress(self, identifier: string?): boolean
	function Redo(self): nil
	function ResetWaypoints(self): nil
	function SetEnabled(self, state: boolean): nil
	function SetWaypoint(self, name: string): nil
	function TryBeginRecording(self, name: string, displayName: string?): string?
	function Undo(self): nil
end

declare class CharacterAppearance extends Instance
end

declare class BodyColors extends CharacterAppearance
	HeadColor3: Color3
	HeadColor: BrickColor
	LeftArmColor3: Color3
	LeftArmColor: BrickColor
	LeftLegColor3: Color3
	LeftLegColor: BrickColor
	RightArmColor3: Color3
	RightArmColor: BrickColor
	RightLegColor3: Color3
	RightLegColor: BrickColor
	TorsoColor3: Color3
	TorsoColor: BrickColor
end

declare class CharacterMesh extends CharacterAppearance
	BaseTextureId: number
	BodyPart: EnumBodyPart
	MeshId: number
	OverlayTextureId: number
end

declare class Clothing extends CharacterAppearance
	Color3: Color3
end

declare class Pants extends Clothing
	PantsTemplate: Content
end

declare class Shirt extends Clothing
	ShirtTemplate: Content
end

declare class ShirtGraphic extends CharacterAppearance
	Color3: Color3
	Graphic: Content
end



declare class Chat extends Instance
	BubbleChatEnabled: boolean
	BubbleChatSettingsChanged: RBXScriptSignal<any>
	Chatted: RBXScriptSignal<BasePart, string, EnumChatColor>
	LoadDefaultChat: boolean
	function CanUserChatAsync(self, userId: number): boolean
	function CanUsersChatAsync(self, userIdFrom: number, userIdTo: number): boolean
	function Chat(self, partOrCharacter: Instance, message: string, color: EnumChatColor?): nil
	function ChatLocal(self, partOrCharacter: Instance, message: string, color: EnumChatColor?): nil
	function FilterStringAsync(self, stringToFilter: string, playerFrom: Player, playerTo: Player): string
	function FilterStringForBroadcast(self, stringToFilter: string, playerFrom: Player): string
	function GetShouldUseLuaChat(self): boolean
	function InvokeChatCallback(self, callbackType: EnumChatCallbackType, callbackArguments: any): any
	function RegisterChatCallback(self, callbackType: EnumChatCallbackType, callbackFunction: ((...any) -> ...any)): nil
	function SetBubbleChatSettings(self, settings: any): nil
end

declare class ChatbotUIService extends Instance
end

declare class ClickDetector extends Instance
	CursorIcon: Content
	MaxActivationDistance: number
	MouseClick: RBXScriptSignal<Player>
	MouseHoverEnter: RBXScriptSignal<Player>
	MouseHoverLeave: RBXScriptSignal<Player>
	RightMouseClick: RBXScriptSignal<Player>
end

declare class DragDetector extends ClickDetector
	ActivatedCursorIcon: Content
	ApplyAtCenterOfMass: boolean
	Axis: Vector3
	DragContinue: RBXScriptSignal<Player, Ray, CFrame, CFrame?, boolean>
	DragEnd: RBXScriptSignal<Player>
	DragFrame: CFrame
	DragStart: RBXScriptSignal<Player, Ray, CFrame, CFrame, BasePart, CFrame?, boolean>
	DragStyle: EnumDragDetectorDragStyle
	Enabled: boolean
	MaxDragAngle: number
	MaxDragTranslation: Vector3
	MaxForce: number
	MaxTorque: number
	MinDragAngle: number
	MinDragTranslation: Vector3
	Orientation: Vector3
	ReferenceInstance: Instance
	ResponseStyle: EnumDragDetectorResponseStyle
	Responsiveness: number
	RunLocally: boolean
	SecondaryAxis: Vector3
	TrackballRadialPullFactor: number
	TrackballRollFactor: number
	WorldAxis: Vector3
	WorldSecondaryAxis: Vector3
	function AddConstraintFunction(self, priority: number, func: ((...any) -> ...any)): RBXScriptConnection
	function GetReferenceFrame(self): CFrame
	function RestartDrag(self): nil
	function SetDragStyleFunction(self, func: ((...any) -> ...any)): nil
end

declare class ClusterPacketCache extends Instance
end

declare class CollectionService extends Instance
	ItemAdded: RBXScriptSignal<Instance>
	ItemRemoved: RBXScriptSignal<Instance>
	function GetCollection(self, tag: string): { Instance }
end

declare class CommandInstance extends Instance
	AllowGUIAccessPoints: boolean
	Checked: boolean
	DefaultShortcut: string
	DisplayName: string
	Enabled: boolean
	Icon: string
	Name: string
	Permission: EnumCommandPermission
	StatusTip: string
	function EnableGuiAccess(self, displayName: string, statusTip: string, defaultShortcut: string): nil
	function RegisterExecutionCallback(self, callbackFunction: ((...any) -> ...any)): nil
end

declare class Configuration extends Instance
end

declare class ConfigureServerService extends Instance
end

declare class AnimationConstraint extends Constraint
	IsKinematic: boolean
	MaxForce: number
	MaxTorque: number
	Transform: CFrame
end

declare class BallSocketConstraint extends Constraint
	LimitsEnabled: boolean
	MaxFrictionTorque: number
	Radius: number
	Restitution: number
	TwistLimitsEnabled: boolean
	TwistLowerAngle: number
	TwistUpperAngle: number
	UpperAngle: number
end

declare class LineForce extends Constraint
	ApplyAtCenterOfMass: boolean
	InverseSquareLaw: boolean
	Magnitude: number
	MaxForce: number
	ReactionForceEnabled: boolean
end

declare class LinearVelocity extends Constraint
	ForceLimitMode: EnumForceLimitMode
	LineDirection: Vector3
	LineVelocity: number
	MaxAxesForce: Vector3
	MaxForce: number
	MaxPlanarAxesForce: Vector2
	PlaneVelocity: Vector2
	PrimaryTangentAxis: Vector3
	RelativeTo: EnumActuatorRelativeTo
	SecondaryTangentAxis: Vector3
	VectorVelocity: Vector3
	VelocityConstraintMode: EnumVelocityConstraintMode
end


-- As far as I can tell, RigidConstraint doesn't exist in 2013
-- declare class RigidConstraint extends Constraint
-- end

declare class Torque extends Constraint
	RelativeTo: EnumActuatorRelativeTo
	Torque: Vector3
end

declare class ContentProvider extends Instance
	AssetFetchFailed: RBXScriptSignal<Content>
	BaseUrl: string
	RequestQueueSize: number
	function CalculateNumTrianglesInMesh(self, meshId: string): number
	function CalculateNumTrianglesInMeshSync(self, meshId: string): number
	function GetAssetFetchStatus(self, contentId: Content): EnumAssetFetchStatus
	function GetAssetFetchStatusChangedSignal(self, contentId: Content): RBXScriptSignal
	function GetDetailedFailedRequests(self): { any }
	function GetFailedRequests(self): { any }
	function ListEncryptedAssets(self): { any }
	function Preload(self, contentId: string): nil
	function PreloadAsync(self, contentIdList: { any }, callbackFunction: ((...any) -> ...any)?): nil
	function RegisterDefaultEncryptionKey(self, encryptionKey: string): nil
	function RegisterDefaultSessionKey(self, sessionKey: string): nil
	function RegisterEncryptedAsset(self, assetId: Content, encryptionKey: string): nil
	function RegisterSessionEncryptedAsset(self, contentId: Content, sessionKey: string): nil
	function SetBaseUrl(self, url: string): nil
	function SetThreadPool(self, count: number): nil
	function UnregisterDefaultEncryptionKey(self): nil
	function UnregisterEncryptedAsset(self, assetId: Content): nil
end

declare class ContextActionService extends Instance
	LocalToolEquipped: RBXScriptSignal<Tool>
	LocalToolUnequipped: RBXScriptSignal<Tool>
	function BindActivate(self, userInputTypeForActivation: EnumUserInputType, keyCodesForActivation: any): nil
	function GetCurrentLocalToolIcon(self): string
end

declare class Controller extends Instance
	ButtonChanged: RBXScriptSignal<EnumButton>
	function BindButton(self, button: EnumButton, caption: string): nil
	function GetButton(self, button: EnumButton): boolean
	function UnbindButton(self, button: EnumButton): nil
end

declare class HumanoidController extends Controller
end

declare class SkateboardController extends Controller
	AxisChanged: RBXScriptSignal<string>
	Steer: number
	Throttle: number
end

declare class VehicleController extends Controller
end

declare class ControllerService extends Instance
end

declare class CookiesService extends Instance
	-- "An error occurred" when calling any of these methods
	function DeleteCookieValue(self, key: string): nil
	function GetCookieValue(self, key: string): string
	function SetCookieValue(self, key: string, value: string): nil
end


declare class DataModelMesh extends Instance
	Offset: Vector3
	Scale: Vector3
	VertexColor: Vector3
end




declare class FileMesh extends DataModelMesh
	MeshId: Content
	TextureId: Content
end

declare class SpecialMesh extends FileMesh
	MeshType: EnumMeshType
end

declare class DataStoreInfo extends Instance
	CreatedTime: number
	DataStoreName: string
	UpdatedTime: number
end

declare class DataStoreKey extends Instance
	KeyName: string
end

declare class DataStoreKeyInfo extends Instance
	CreatedTime: number
	UpdatedTime: number
	Version: string
	function GetMetadata(self): { [any]: any }
	function GetUserIds(self): { number }
end

declare class DataStoreObjectVersionInfo extends Instance
	CreatedTime: number
	IsDeleted: boolean
	Version: string
end

declare class DataStoreOptions extends Instance
	AllScopes: boolean
	function SetExperimentalFeatures(self, experimentalFeatures: { [any]: any }): nil
end

declare class DataStoreService extends Instance
	function GetGlobalDataStore(self): GlobalDataStore
end

declare class Debris extends Instance
	function AddItem(self, item: Instance, lifetime: number?): nil
	function SetLegacyMaxItems(self, enabled: boolean): nil
end

declare class DebugSettings extends Instance
	DataModel: number
	InstanceCount: number
	IsScriptStackTracingEnabled: boolean
	JobCount: number
	PlayerCount: number
	ReportSoundWarnings: boolean
	RobloxVersion: string
	TickCountPreciseOverride: EnumTickCountSampleMethod

	LuaRamLimit: number

	function LegacyScriptMode(self): nil
end

declare class DebuggerBreakpoint extends Instance
	Condition: string
	IsEnabled: boolean
	Line: number
end

declare class DebuggerLuaResponse extends Instance
	IsError: boolean
	IsSuccess: boolean
	Message: string
	RequestId: number
	Status: EnumDebuggerStatus
	function GetArg(self): any
end

declare class DebuggerManager extends Instance
	DebuggerAdded: RBXScriptSignal<Instance>
	DebuggerRemoved: RBXScriptSignal<Instance>
	DebuggingEnabled: boolean
	function AddDebugger(self, script: Instance): Instance
	function EnableDebugging(self): nil
	function GetDebuggers(self): { Instance }
end

declare class DebuggerVariable extends Instance
	Name: string
	Populated: boolean
	Type: string
	Value: string
	VariableId: number
	VariablesCount: number
	function GetVariableByIndex(self, index: number): DebuggerVariable
	function GetVariableByName(self, name: string): DebuggerVariable
end

declare class DebuggerWatch extends Instance
	Expression: string
end

declare class DeviceIdService extends Instance
	function GetDeviceId(self): string
end

declare class Dialog extends Instance
	BehaviorType: EnumDialogBehaviorType
	ConversationDistance: number
	DialogChoiceSelected: RBXScriptSignal<Player, DialogChoice>
	GoodbyeChoiceActive: boolean
	GoodbyeDialog: string
	InUse: boolean
	InitialPrompt: string
	Purpose: EnumDialogPurpose
	Tone: EnumDialogTone
	TriggerDistance: number
	TriggerOffset: Vector3
	function GetCurrentPlayers(self): { Player }
	function SetPlayerIsUsing(self, player: Instance, isUsing: boolean): nil
	function SignalDialogChoiceSelected(self, player: Instance, dialogChoice: Instance): nil
end

declare class DialogChoice extends Instance
	GoodbyeChoiceActive: boolean
	GoodbyeDialog: string
	ResponseDialog: string
	UserDialog: string
end

declare class Dragger extends Instance
	function AxisRotate(self, axis: EnumAxis?): nil
	function MouseDown(self, mousePart: Instance, pointOnMousePart: Vector3, parts: { Instance }): nil
	function MouseMove(self, mouseRay: Ray): nil
	function MouseUp(self): nil
end

declare class DynamicImage extends Instance
	Size: Vector2
	function Clear(self): nil
	function DrawCircle(self, center: Vector2, radius: number, color: Color3, transparency: number): nil
	function ReadPixels(self, position: Vector2, size: Vector2): { any }
	function Resize(self, newSize: Vector2): nil
	function Rotate(self, degrees: number, resizeCanvas: boolean?): nil
	function WritePixels(self, position: Vector2, size: Vector2, pixels: { any }): nil
end

declare class EventIngestService extends Instance
	function SendEventDeferred(self, target: string, eventContext: string, eventName: string, additionalArgs: { [any]: any }): nil
	function SendEventImmediately(self, target: string, eventContext: string, eventName: string, additionalArgs: { [any]: any }): nil
	function SetRBXEvent(self, target: string, eventContext: string, eventName: string, additionalArgs: { [any]: any }): nil
	function SetRBXEventStream(self, target: string, eventContext: string, eventName: string, additionalArgs: { [any]: any }): nil
end

declare class Explosion extends Instance
	BlastPressure: number
	BlastRadius: number
	DestroyJointRadiusPercent: number
	ExplosionType: EnumExplosionType
	Hit: RBXScriptSignal<BasePart, number>
	Position: Vector3
	TimeScale: number
	Visible: boolean
end

declare class FaceInstance extends Instance
	Face: EnumNormalId
end

declare class Decal extends FaceInstance
	Color3: Color3
	LocalTransparencyModifier: number
	Texture: Content
	Transparency: number
	ZIndex: number
end

declare class Texture extends Decal
	OffsetStudsU: number
	OffsetStudsV: number
	StudsPerTileU: number
	StudsPerTileV: number
end

declare class Feature extends Instance
	FaceId: EnumNormalId
	InOut: EnumInOut
	LeftRight: EnumLeftRight
	TopBottom: EnumTopBottom
end





declare class Fire extends Instance
	Color: Color3
	Enabled: boolean
	Heat: number
	SecondaryColor: Color3
	Size: number
	TimeScale: number
	function FastForward(self, numFrames: number): nil
end

declare class FlagStandService extends Instance
end

declare class ForceField extends Instance
	Visible: boolean
end

declare class FriendService extends Instance
	FriendsUpdated: RBXScriptSignal<{ any }>
	function GetPlatformFriends(self): { any }
end



declare class GamePassService extends Instance
	function SetPlayerHasPassUrl(self, playerHasPassUrl: string): nil
end

declare class GameSettings extends Instance
	VideoCaptureEnabled: boolean
	VideoRecording: boolean
	VideoRecordingChangeRequest: RBXScriptSignal<boolean>
end

declare class GamepadService extends Instance
	GamepadCursorEnabled: boolean
	GamepadThumbstick1Changed: RBXScriptSignal<Vector2>
	function DisableGamepadCursor(self): nil
	function EnableGamepadCursor(self, guiObject: Instance): nil
	function GetGamepadCursorPosition(self): Vector2
	function SetGamepadCursorPosition(self, position: Vector2): nil
end

declare class GetTextBoundsParams extends Instance
	Font: Font
	Size: number
	Text: string
	Width: number
end

declare class GlobalDataStore extends Instance
	function GetAsync(self, key: string): (any, DataStoreKeyInfo)
	function IncrementAsync(self, key: string, delta: number?): (number, DataStoreKeyInfo)
	function SetAsync(self, key: string, value: any): string
	function UpdateAsync(self, key: string, transformFunction: ((any, DataStoreKeyInfo) -> (any, { number }?, {}?))): (any, DataStoreKeyInfo)
end

declare class GuiBase extends Instance
end

declare class GuiBase2d extends GuiBase
	AbsolutePosition: Vector2
	AbsoluteRotation: number
	AbsoluteSize: Vector2
	AutoLocalize: boolean
	ClippedRect: Rect
	IsNotOccluded: boolean
	RawRect2D: Rect
	SelectionBehaviorDown: EnumSelectionBehavior
	SelectionBehaviorLeft: EnumSelectionBehavior
	SelectionBehaviorRight: EnumSelectionBehavior
	SelectionBehaviorUp: EnumSelectionBehavior
	SelectionChanged: RBXScriptSignal<boolean, GuiObject, GuiObject>
	SelectionGroup: boolean
	TotalGroupScale: number
end

declare class GuiObject extends GuiBase2d
	Active: boolean
	AnchorPoint: Vector2
	AutomaticSize: EnumAutomaticSize
	BackgroundColor3: Color3
	BackgroundTransparency: number
	BorderColor3: Color3
	BorderMode: EnumBorderMode
	BorderSizePixel: number
	ClipsDescendants: boolean
	GuiState: EnumGuiState
	InputBegan: RBXScriptSignal<InputObject>
	InputChanged: RBXScriptSignal<InputObject>
	InputEnded: RBXScriptSignal<InputObject>
	Interactable: boolean
	LayoutOrder: number
	MouseEnter: RBXScriptSignal<number, number>
	MouseLeave: RBXScriptSignal<number, number>
	MouseMoved: RBXScriptSignal<number, number>
	MouseWheelBackward: RBXScriptSignal<number, number>
	MouseWheelForward: RBXScriptSignal<number, number>
	NextSelectionDown: GuiObject
	NextSelectionLeft: GuiObject
	NextSelectionRight: GuiObject
	NextSelectionUp: GuiObject
	Position: UDim2
	Rotation: number
	Selectable: boolean
	SelectionGained: RBXScriptSignal<>
	SelectionImageObject: GuiObject
	SelectionLost: RBXScriptSignal<>
	SelectionOrder: number
	Size: UDim2
	SizeConstraint: EnumSizeConstraint
	TouchLongPress: RBXScriptSignal<{ Vector2 }, EnumUserInputState>
	TouchPan: RBXScriptSignal<{ Vector2 }, Vector2, Vector2, EnumUserInputState>
	TouchPinch: RBXScriptSignal<{ Vector2 }, number, number, EnumUserInputState>
	TouchRotate: RBXScriptSignal<{ Vector2 }, number, number, EnumUserInputState>
	TouchSwipe: RBXScriptSignal<EnumSwipeDirection, number>
	TouchTap: RBXScriptSignal<{ Vector2 }>
	Transparency: number
	Visible: boolean
	ZIndex: number
	function TweenPosition(self, endPosition: UDim2, easingDirection: EnumEasingDirection?, easingStyle: EnumEasingStyle?, time: number?, override: boolean?, callback: ((...any) -> ...any)?): boolean
	function TweenSize(self, endSize: UDim2, easingDirection: EnumEasingDirection?, easingStyle: EnumEasingStyle?, time: number?, override: boolean?, callback: ((...any) -> ...any)?): boolean
	function TweenSizeAndPosition(self, endSize: UDim2, endPosition: UDim2, easingDirection: EnumEasingDirection?, easingStyle: EnumEasingStyle?, time: number?, override: boolean?, callback: ((...any) -> ...any)?): boolean
end

declare class Frame extends GuiObject
	Style: EnumFrameStyle
end

declare class GuiButton extends GuiObject
	Activated: RBXScriptSignal<InputObject, number>
	AutoButtonColor: boolean
	Modal: boolean
	MouseButton1Click: RBXScriptSignal<>
	MouseButton1Down: RBXScriptSignal<number, number>
	MouseButton1Up: RBXScriptSignal<number, number>
	MouseButton2Click: RBXScriptSignal<>
	MouseButton2Down: RBXScriptSignal<number, number>
	MouseButton2Up: RBXScriptSignal<number, number>
	Selected: boolean
	Style: EnumButtonStyle
end

declare class ImageButton extends GuiButton
	Image: Content
	ImageRectOffset: Vector2
	ImageRectSize: Vector2
end

declare class TextButton extends GuiButton
	ContentText: string
	Font: EnumFont
	FontFace: Font
	LineHeight: number
	LocalizedText: string
	MaxVisibleGraphemes: number
	RichText: boolean
	Text: string
	TextBounds: Vector2
	TextColor3: Color3
	TextFits: boolean
	TextScaled: boolean
	TextSize: number
	TextStrokeColor3: Color3
	TextStrokeTransparency: number
	TextTransparency: number
	TextTruncate: EnumTextTruncate
	TextWrapped: boolean
	TextXAlignment: EnumTextXAlignment
	TextYAlignment: EnumTextYAlignment
	function SetTextFromInput(self, text: string): nil
end

declare class GuiLabel extends GuiObject
end

declare class ImageLabel extends GuiLabel
	Image: Content
	ImageRectOffset: Vector2
	ImageRectSize: Vector2
end

declare class TextLabel extends GuiLabel
	ContentText: string
	Font: EnumFont
	FontFace: Font
	LineHeight: number
	Text: string
	TextBounds: Vector2
	TextColor3: Color3
	TextFits: boolean
	TextScaled: boolean
	TextSize: number
	TextStrokeColor3: Color3
	TextStrokeTransparency: number
	TextTransparency: number
	TextTruncate: EnumTextTruncate
	TextWrapped: boolean
	TextXAlignment: EnumTextXAlignment
	TextYAlignment: EnumTextYAlignment

	FontSize: EnumFontSize
end

declare class TextBox extends GuiObject
	ClearTextOnFocus: boolean
	FocusLost: RBXScriptSignal<boolean, InputObject>
	Font: EnumFont
	LineHeight: number
	ManualFocusRelease: boolean
	MaxVisibleGraphemes: number
	MultiLine: boolean
	OverlayNativeInput: boolean
	PlaceholderColor3: Color3
	PlaceholderText: string
	ReturnKeyType: EnumReturnKeyType
	ReturnPressedFromOnScreenKeyboard: RBXScriptSignal<>
	RichText: boolean
	SelectionStart: number
	ShowNativeInput: boolean
	Text: string
	TextBounds: Vector2
	TextColor3: Color3
	TextEditable: boolean
	TextFits: boolean
	TextInputType: EnumTextInputType
	TextScaled: boolean
	TextSize: number
	TextStrokeColor3: Color3
	TextStrokeTransparency: number
	TextTransparency: number
	TextTruncate: EnumTextTruncate
	TextWrapped: boolean
	TextXAlignment: EnumTextXAlignment
	TextYAlignment: EnumTextYAlignment
	function CaptureFocus(self): nil
	function IsFocused(self): boolean
	function ReleaseFocus(self, submitted: boolean?): nil
	function ResetKeyboardMode(self): nil
	function SetTextFromInput(self, text: string): nil
end

declare class LayerCollector extends GuiBase2d
end

declare class BillboardGui extends LayerCollector
	Active: boolean
	Adornee: Instance
	AlwaysOnTop: boolean
	Brightness: number
	ClipsDescendants: boolean
	CurrentDistance: number
	DistanceLowerLimit: number
	DistanceStep: number
	DistanceUpperLimit: number
	ExtentsOffset: Vector3
	ExtentsOffsetWorldSpace: Vector3
	LightInfluence: number
	MaxDistance: number
	PlayerToHideFrom: Instance
	Size: UDim2
	SizeOffset: Vector2
	StudsOffset: Vector3
	StudsOffsetWorldSpace: Vector3
	function GetScreenSpaceBounds(self): any
end

declare class PluginGui extends LayerCollector
	PluginDragDropped: RBXScriptSignal<{ [any]: any }>
	PluginDragEntered: RBXScriptSignal<{ [any]: any }>
	PluginDragLeft: RBXScriptSignal<{ [any]: any }>
	PluginDragMoved: RBXScriptSignal<{ [any]: any }>
	Title: string
	WindowFocusReleased: RBXScriptSignal<>
	WindowFocused: RBXScriptSignal<>
	function BindToClose(self, func: ((...any) -> ...any)?): nil
	function GetRelativeMousePosition(self): Vector2
end

declare class QWidgetPluginGui extends PluginGui
end

declare class ScreenGui extends LayerCollector
	ClipToDeviceSafeArea: boolean
	DisplayOrder: number
	IgnoreGuiInset: boolean
	OnTopOfCoreBlur: boolean
	SafeAreaCompatibility: EnumSafeAreaCompatibility
end



declare class SurfaceGuiBase extends LayerCollector
	Active: boolean
	Adornee: Instance
	Face: EnumNormalId
end

declare class AdGui extends SurfaceGuiBase
	AdShape: EnumAdShape
	FallbackImage: Content
	Status: EnumAdUnitStatus
end

declare class SurfaceGui extends SurfaceGuiBase
	AlwaysOnTop: boolean
	Brightness: number
	CanvasSize: Vector2
	ClipsDescendants: boolean
	HorizontalCurvature: number
	LightInfluence: number
	PixelsPerStud: number
	Shape: EnumSurfaceGuiShape
	SizingMode: EnumSurfaceGuiSizingMode
	ToolPunchThroughDistance: number
	ZOffset: number
end

declare class GuiBase3d extends GuiBase
	Color3: Color3
	Transparency: number
	Visible: boolean
end



declare class InstanceAdornment extends GuiBase3d
	Adornee: Instance?
end

declare class SelectionBox extends InstanceAdornment
	LineThickness: number
	StudioSelectionBox: boolean
	SurfaceColor3: Color3
	SurfaceTransparency: number
end

declare class PVAdornment extends GuiBase3d
	Adornee: PVInstance
end

declare class HandleAdornment extends PVAdornment
	AdornCullingMode: EnumAdornCullingMode
	AlwaysOnTop: boolean
	CFrame: CFrame
	MouseButton1Down: RBXScriptSignal<>
	MouseButton1Up: RBXScriptSignal<>
	MouseEnter: RBXScriptSignal<>
	MouseLeave: RBXScriptSignal<>
	SizeRelativeOffset: Vector3
	ZIndex: number
end

declare class BoxHandleAdornment extends HandleAdornment
	Size: Vector3
end

declare class ConeHandleAdornment extends HandleAdornment
	Height: number
	Radius: number
end

declare class CylinderHandleAdornment extends HandleAdornment
	Angle: number
	Height: number
	InnerRadius: number
	Radius: number
end

declare class ImageHandleAdornment extends HandleAdornment
	Image: Content
	Size: Vector2
end

declare class LineHandleAdornment extends HandleAdornment
	Length: number
	Thickness: number
end

declare class SphereHandleAdornment extends HandleAdornment
	Radius: number
end

declare class WireframeHandleAdornment extends HandleAdornment
	Scale: Vector3
	function AddLine(self, from: Vector3, to: Vector3): nil
	function AddLines(self, points: { any }): nil
	function AddPath(self, points: { any }, loop: boolean): nil
	function Clear(self): nil
end

declare class ParabolaAdornment extends PVAdornment
	A: number
	B: number
	C: number
	Range: number
	Thickness: number
	function FindPartOnParabola(self, ignoreDescendentsTable: { Instance }): any
end

declare class SelectionSphere extends PVAdornment
	SurfaceColor3: Color3
	SurfaceTransparency: number
end

declare class PartAdornment extends GuiBase3d
	Adornee: BasePart?
end

declare class HandlesBase extends PartAdornment
end

declare class ArcHandles extends HandlesBase
	Axes: Axes
	MouseButton1Down: RBXScriptSignal<EnumAxis>
	MouseButton1Up: RBXScriptSignal<EnumAxis>
	MouseDrag: RBXScriptSignal<EnumAxis, number, number>
	MouseEnter: RBXScriptSignal<EnumAxis>
	MouseLeave: RBXScriptSignal<EnumAxis>
end

declare class Handles extends HandlesBase
	Faces: Faces
	MouseButton1Down: RBXScriptSignal<EnumNormalId>
	MouseButton1Up: RBXScriptSignal<EnumNormalId>
	MouseDrag: RBXScriptSignal<EnumNormalId, number>
	MouseEnter: RBXScriptSignal<EnumNormalId>
	MouseLeave: RBXScriptSignal<EnumNormalId>
	Style: EnumHandlesStyle
end

declare class SurfaceSelection extends PartAdornment
	TargetSurface: EnumNormalId
end

declare class SelectionLasso extends GuiBase3d
	Humanoid: Humanoid
end





declare class GuiService extends Instance
	AutoSelectGuiEnabled: boolean
	CloseInspectMenuRequest: RBXScriptSignal<>
	CoreGuiNavigationEnabled: boolean
	CoreGuiRenderOverflowed: RBXScriptSignal<>
	EmotesMenuOpenChanged: RBXScriptSignal<boolean>
	GuiNavigationEnabled: boolean
	GuiVisibilityChangedSignal: RBXScriptSignal<EnumGuiType, boolean>
	InspectMenuEnabledChangedSignal: RBXScriptSignal<boolean>
	InspectPlayerFromUserIdWithCtxRequest: RBXScriptSignal<number, string>
	KeyPressed: RBXScriptSignal<string, string>
	MenuClosed: RBXScriptSignal<>
	MenuIsOpen: boolean
	MenuOpened: RBXScriptSignal<>
	NativeClose: RBXScriptSignal<>
	NetworkPausedEnabledChanged: RBXScriptSignal<boolean>
	Open9SliceEditor: RBXScriptSignal<Instance>
	PreferredTransparency: number
	PurchasePromptShown: RBXScriptSignal<>
	ReducedMotionEnabled: boolean
	SafeZoneOffsetsChanged: RBXScriptSignal<>
	SelectedCoreObject: GuiObject
	SelectedObject: GuiObject?
	SendCoreUiNotification: (title: string, text: string) -> nil
	SendNotification: (self: GuiService, title: string, text: string, text2: string, number: number, callback: (any) -> any) -> nil
	ShowLeaveConfirmation: RBXScriptSignal<>
	SpecialKeyPressed: RBXScriptSignal<EnumSpecialKey, string>
	TouchControlsEnabled: boolean
	UiMessageChanged: RBXScriptSignal<EnumUiMessageType, string>

	EscapeKeyPressed: RBXScriptSignal<>
	BrowserWindowClosed: RBXScriptSignal<>
	IsWindows: boolean
	IsModalDialog: boolean
	UseLuaChat: boolean

	function AddCenterDialog(self, dialog: Instance, centerDialogType: EnumCenterDialogType, showFunction: ((...any) -> ...any), hideFunction: ((...any) -> ...any)): nil
	function AddKey(self, key: string): nil
	function AddSelectionParent(self, selectionName: string, selectionParent: Instance): nil
	function AddSelectionTuple(self, selectionName: string, selections: any): nil
	function AddSpecialKey(self, key: EnumSpecialKey): nil
	function BroadcastNotification(self, data: string, notificationType: number): nil
	function ClearError(self): nil
	function CloseInspectMenu(self): nil
	function CloseStatsBasedOnInputString(self, input: string): boolean
	function ForceTenFootInterface(self, isForced: boolean): nil
	function GetBrickCount(self): number
	function GetClosestDialogToPosition(self, position: Vector3): Instance
	function GetEmotesMenuOpen(self): boolean
	function GetGameplayPausedNotificationEnabled(self): boolean
	function GetGuiInset(self): (Vector2, Vector2)
	function GetGuiIsVisible(self, guiType: EnumGuiType): boolean
	function GetInspectMenuEnabled(self): boolean
	function GetNotificationTypeList(self): { [any]: any }
	function GetResolutionScale(self): number
	function GetSafeZoneOffsets(self): { [any]: any }
	function GetScreenResolution(self): Vector2
	function GetUiMessage(self): string
	function InspectPlayerFromUserId(self, userId: number): nil
	function InspectPlayerFromUserIdWithCtx(self, userId: number, ctx: string): nil
	function IsMemoryTrackerEnabled(self): boolean
	function IsTenFootInterface(self): boolean
	function RemoveCenterDialog(self, dialog: Instance): nil
	function RemoveKey(self, key: string): nil
	function RemoveSelectionGroup(self, selectionName: string): nil
	function RemoveSpecialKey(self, key: EnumSpecialKey): nil
	function Select(self, selectionParent: Instance): nil
	function SetEmotesMenuOpen(self, isOpen: boolean): nil
	function SetGameplayPausedNotificationEnabled(self, enabled: boolean): nil
	function SetGlobalGuiInset(self, x1: number, y1: number, x2: number, y2: number): nil
	function SetHardwareSafeAreaInsets(self, left: number, top: number, right: number, bottom: number): nil
	function SetInspectMenuEnabled(self, enabled: boolean): nil
	function SetMenuIsOpen(self, open: boolean, menuName: string?): nil
	function SetPurchasePromptIsShown(self, isShown: boolean): nil
	function SetSafeZoneOffsets(self, top: number, bottom: number, left: number, right: number): nil
	function SetUiMessage(self, msgType: EnumUiMessageType, uiMessage: string?): nil
	function ShowStatsBasedOnInputString(self, input: string): boolean
	function ToggleFullscreen(self): nil
	function ToggleGuiIsVisibleForCaptures(self, guiType: EnumGuiType): nil
	function ToggleGuiIsVisibleIfAllowed(self, guiType: EnumGuiType): nil

	function OpenBrowserWindow(self, url: string): nil
	function SetGlobalSizeOffsetPixel(self, x: number, y: number): nil
end

declare class GuidRegistryService extends Instance
end

declare class HttpService extends Instance
	HttpEnabled: boolean
	function GetAsync(self, url: string, nocache: boolean?, headers: any): string
	function JSONDecode(self, input: string): any
	function JSONEncode(self, input: any): string
	function PostAsync(self, url: string, data: string, content_type: EnumHttpContentType?, compress: boolean?, headers: any): string
	function UrlEncode(self, input: string): string
end

declare class Humanoid extends Instance
	AutoJumpEnabled: boolean
	AutoRotate: boolean
	AutomaticScalingEnabled: boolean
	BreakJointsOnDeath: boolean
	CameraOffset: Vector3
	Climbing: RBXScriptSignal<number>
	ClusterCompositionFinished: RBXScriptSignal<>
	Died: RBXScriptSignal<>
	DisplayDistanceType: EnumHumanoidDisplayDistanceType
	DisplayName: string
	EmoteTriggered: RBXScriptSignal<boolean, AnimationTrack>
	EvaluateStateMachine: boolean
	FallingDown: RBXScriptSignal<boolean>
	FloorMaterial: EnumMaterial
	FreeFalling: RBXScriptSignal<boolean>
	GettingUp: RBXScriptSignal<boolean>
	Health: number
	HealthChanged: RBXScriptSignal<number>
	HealthDisplayDistance: number
	HealthDisplayType: EnumHumanoidHealthDisplayType
	HipHeight: number
	InternalDisplayName: string
	Jump: boolean
	JumpHeight: number
	JumpPower: number
	Jumping: RBXScriptSignal<boolean>
	MaxHealth: number
	MaxSlopeAngle: number
	MoveDirection: Vector3
	MoveToFinished: RBXScriptSignal<boolean>
	NameDisplayDistance: number
	NameOcclusion: EnumNameOcclusion
	PlatformStand: boolean
	PlatformStanding: RBXScriptSignal<boolean>
	Ragdoll: RBXScriptSignal<boolean>
	RequiresNeck: boolean
	RootPart: BasePart?
	Running: RBXScriptSignal<number>
	SeatPart: Seat | VehicleSeat | nil
	Seated: RBXScriptSignal<boolean, Seat>
	Sit: boolean
	StateChanged: RBXScriptSignal<EnumHumanoidStateType, EnumHumanoidStateType>
	StateEnabledChanged: RBXScriptSignal<EnumHumanoidStateType, boolean>
	Strafing: RBXScriptSignal<boolean>
	Swimming: RBXScriptSignal<number>
	TargetPoint: Vector3
	Touched: RBXScriptSignal<BasePart, BasePart>
	UseJumpPower: boolean
	WalkSpeed: number
	WalkToPart: BasePart?
	WalkToPoint: Vector3
	function BuildRigFromAttachments(self): nil
	function CacheDefaults(self): nil
	function ChangeState(self, state: EnumHumanoidStateType?): nil
	function EquipTool(self, tool: Tool): nil
	function GetAccessories(self): { Accessory }
	function GetLimb(self, part: BasePart): EnumLimb
	function GetMoveVelocity(self): Vector3
	function GetState(self): EnumHumanoidStateType
	function GetStateEnabled(self, state: EnumHumanoidStateType): boolean
	function Move(self, moveDirection: Vector3, relativeToCamera: boolean?): nil
	function MoveTo(self, location: Vector3, part: BasePart?): nil
	function PlayEmote(self, emoteName: string): boolean
	function PlayEmoteAndGetAnimTrackById(self, emoteId: number): any
	function RemoveAccessories(self): nil
	function SetClickToWalkEnabled(self, enabled: boolean): nil
	function SetStateEnabled(self, state: EnumHumanoidStateType, enabled: boolean): nil
	function TakeDamage(self, amount: number): nil
	function UnequipTools(self): nil
end

declare class InputObject extends Instance
	Delta: Vector3
	Position: Vector3
	UserInputState: EnumUserInputState
	UserInputType: EnumUserInputType
end

declare class InsertService extends Instance
	AllowClientInsertModels: boolean
	function GetBaseSets(self): { any }
	function GetCollection(self, categoryId: number): { any }
	function GetFreeDecals(self, searchText: string, pageNum: number): { any }
	function GetFreeModels(self, searchText: string, pageNum: number): { any }
	function GetLatestAssetVersionAsync(self, assetId: number): number
	function GetLocalFileContents(self, contentId: string): string
	function GetUserSets(self, userId: number): { any }
	function LoadAsset(self, assetId: number): Instance
	function LoadAssetVersion(self, assetVersionId: number): Instance
	function LoadAssetWithFormat(self, assetId: number, format: string): { Instance }
	function LoadLocalAsset(self, assetPath: string): Instance
	function LoadPackageAsset(self, url: Content): { Instance }
	function LoadPackageAssetAsync(self, url: Content): { Instance }

	function SetAssetUrl(self, assetUrl: string): nil
	function SetAssetVersionUrl(self, assetVersionUrl: string): nil
	function SetBaseSetsUrl(self, baseSetsUrl: string): nil
	function SetCollectionUrl(self, collectionUrl: string): nil
	function SetUserSetsUrl(self, userSetsUrl: string): nil
	function SetTrustLevel(self, trustLevel: number): nil
	function SetFreeModelUrl(self, freeModelUrl: string): nil
	function SetFreeDecalUrl(self, freeDecalUrl: string): nil
end

declare class JointInstance extends Instance
	Active: boolean
	C0: CFrame
	C1: CFrame
	Enabled: boolean
	Part0: BasePart?
	Part1: BasePart?
end

declare class DynamicRotate extends JointInstance
	BaseAngle: number
end













declare class Motor extends JointInstance
	CurrentAngle: number
	DesiredAngle: number
	MaxVelocity: number
	function SetDesiredAngle(self, value: number): nil
end

declare class Motor6D extends Motor
	ChildName: string
	ParentName: string
	Transform: CFrame
end





declare class VelocityMotor extends JointInstance
	CurrentAngle: number
	DesiredAngle: number
	Hole: Hole
	MaxVelocity: number
end

declare class Weld extends JointInstance
end



declare class KeyboardService extends Instance
end

declare class Keyframe extends Instance
	Time: number
	function AddMarker(self, marker: KeyframeMarker): nil
	function AddPose(self, pose: Pose): nil
	function GetMarkers(self): { Instance }
	function GetPoses(self): { Instance }
	function RemoveMarker(self, marker: Instance): nil
	function RemovePose(self, pose: Pose): nil
end

declare class KeyframeMarker extends Instance
	Value: string
end

declare class KeyframeSequenceProvider extends Instance
	function GetAnimations(self, userId: number): Instance
	function GetKeyframeSequenceAsync(self, assetId: Content): Instance
	function GetMemStats(self): { [any]: any }
	function RegisterActiveKeyframeSequence(self, keyframeSequence: Instance): Content
	function RegisterKeyframeSequence(self, keyframeSequence: Instance): Content
end

declare class LanguageService extends Instance
end

declare class Light extends Instance
	Brightness: number
	Color: Color3
	Enabled: boolean
	Shadows: boolean
end

declare class PointLight extends Light
	Range: number
end

declare class SpotLight extends Light
	Angle: number
	Face: EnumNormalId
	Range: number
end

declare class SurfaceLight extends Light
	Angle: number
	Face: EnumNormalId
	Range: number
end

declare class Lighting extends Instance
	Ambient: Color3
	Brightness: number
	ClockTime: number
	ColorShift_Bottom: Color3
	ColorShift_Top: Color3
	EnvironmentDiffuseScale: number
	EnvironmentSpecularScale: number
	ExposureCompensation: number
	FogColor: Color3
	FogEnd: number
	FogStart: number
	GeographicLatitude: number
	GlobalShadows: boolean
	LightingChanged: RBXScriptSignal<boolean>
	OutdoorAmbient: Color3
	ShadowSoftness: number
	Technology: EnumTechnology
	TempUseNewSkyRemovalBehaviour: boolean
	TimeOfDay: string
	function GetMinutesAfterMidnight(self): number
	function GetMoonDirection(self): Vector3
	function GetMoonPhase(self): number
	function GetSunDirection(self): Vector3
	function SetMinutesAfterMidnight(self, minutes: number): nil
end

declare class LocalStorageService extends Instance
	ItemWasSet: RBXScriptSignal<string, string>
	StoreWasCleared: RBXScriptSignal<>
	function Flush(self): nil
	function GetItem(self, key: string): string
	function SetItem(self, key: string, value: string): nil
	function WhenLoaded(self, callback: ((...any) -> ...any)): nil
end

declare class AppStorageService extends LocalStorageService
end

declare class UserStorageService extends LocalStorageService
end

declare class LodDataEntity extends Instance
	EntityLodEnabled: boolean
end

declare class LodDataService extends Instance
end

declare class LoginService extends Instance
	LoginFailed: RBXScriptSignal<string>
	LoginSucceeded: RBXScriptSignal<string>
	function Logout(self): nil
	function PromptLogin(self): nil
end

declare class LuaSettings extends Instance
end

declare class LuaSourceContainer extends Instance
	CurrentEditor: Instance
	RuntimeSource: string
end

declare class BaseScript extends LuaSourceContainer
	Disabled: boolean
	Enabled: boolean
	LinkedSource: Content
	RunContext: EnumRunContext
end

declare class CoreScript extends BaseScript
end

declare class Script extends BaseScript
	Source: ProtectedString
	function GetHash(self): string
end

declare class LocalScript extends Script
end

declare class ModuleScript extends LuaSourceContainer
	LinkedSource: Content
	Source: ProtectedString
end

declare class LuaWebService extends Instance
end

declare class MarketplaceService extends Instance
	ClientLuaDialogRequested: RBXScriptSignal<any>
	ClientPurchaseSuccess: RBXScriptSignal<string, number, number>
	NativePurchaseFinished: RBXScriptSignal<Player, string, boolean>
	NativePurchaseFinishedWithLocalPlayer: RBXScriptSignal<string, boolean>
	PrepareCollectiblesPurchaseRequested: RBXScriptSignal<Instance, number, string, string, string, number>
	ProcessReceipt: (receiptInfo: { [any]: any }) -> EnumProductPurchaseDecision
	PromptBundlePurchaseFinished: RBXScriptSignal<Instance, number, boolean>
	PromptBundlePurchaseRequested: RBXScriptSignal<Instance, number>
	PromptCollectiblesPurchaseRequested: RBXScriptSignal<Instance, number, string, string, string, number, string, string>
	PromptGamePassPurchaseFinished: RBXScriptSignal<Player, number, boolean>
	PromptGamePassPurchaseRequested: RBXScriptSignal<Player, number>
	PromptPremiumPurchaseFinished: RBXScriptSignal<>
	PromptPremiumPurchaseRequested: RBXScriptSignal<Instance>
	PromptProductPurchaseFinished: RBXScriptSignal<number, number, boolean>
	PromptProductPurchaseRequested: RBXScriptSignal<Player, number, boolean, EnumCurrencyType>
	PromptPurchaseFinished: RBXScriptSignal<Player, number, boolean>
	PromptPurchaseRequested: RBXScriptSignal<Player, number, boolean, EnumCurrencyType>
	PromptPurchaseRequestedV2: RBXScriptSignal<Instance, number, boolean, EnumCurrencyType, string, string>
	PromptRobloxPurchaseRequested: RBXScriptSignal<number, boolean>
	PromptSubscriptionPurchaseRequested: RBXScriptSignal<Instance, string>
	ServerPurchaseVerification: RBXScriptSignal<{ [any]: any }>
	ThirdPartyPurchaseFinished: RBXScriptSignal<Instance, string, string, boolean>
	function GetProductInfo(self, assetId: number, infoType: EnumInfoType?): { [any]: any }
	function GetSubscriptionPurchaseInfoAsync(self, subscriptionId: string): { [any]: any }
	function PerformPurchase(self, infoType: EnumInfoType, productId: number, expectedPrice: number, requestId: string, isRobloxPurchase: boolean, collectibleItemId: string?, collectibleProductId: string?, idempotencyKey: string?, purchaseAuthToken: string?): { [any]: any }
	function PerformPurchaseV2(self, infoType: EnumInfoType, productId: number, expectedPrice: number, requestId: string, isRobloxPurchase: boolean, collectiblesProductDetails: { [any]: any }): { [any]: any }
	function PlayerCanMakePurchases(self, player: Instance): boolean
	function PlayerOwnsAsset(self, player: Player, assetId: number): boolean
	function PlayerOwnsBundle(self, player: Player, bundleId: number): boolean
	function PrepareCollectiblesPurchase(self, player: Instance, assetId: number, collectibleItemId: string, collectibleItemInstanceId: string, collectibleProductId: string, expectedPrice: number): nil
	function PromptBundlePurchase(self, player: Player, bundleId: number): nil
	function PromptCollectiblesPurchase(self, player: Instance, assetId: number, collectibleItemId: string, collectibleItemInstanceId: string, collectibleProductId: string, expectedPrice: number): nil
	function PromptGamePassPurchase(self, player: Player, gamePassId: number): nil
	function PromptNativePurchase(self, player: Instance, productId: string): nil
	function PromptNativePurchaseWithLocalPlayer(self, productId: string): nil
	function PromptPremiumPurchase(self, player: Player): nil
	function PromptProductPurchase(self, player: Player, productId: number, equipIfPurchased: boolean?, currencyType: EnumCurrencyType?): nil
	function PromptPurchase(self, player: Player, assetId: number, equipIfPurchased: boolean?, currencyType: EnumCurrencyType?): nil
	function PromptRobloxPurchase(self, assetId: number, equipIfPurchased: boolean): nil
	function PromptSubscriptionPurchaseFinished(self, subscriptionId: string, didTryPurchasing: boolean): nil
	function PromptThirdPartyPurchase(self, player: Instance, productId: string): nil
	function ReportAssetSale(self, assetId: string, robuxAmount: number): nil
	function ReportRobuxUpsellStarted(self): nil
	function SignalClientPurchaseSuccess(self, ticket: string, playerId: number, productId: number): nil
	function SignalMockPurchasePremium(self): nil
	function SignalPromptBundlePurchaseFinished(self, player: Instance, bundleId: number, success: boolean): nil
	function SignalPromptGamePassPurchaseFinished(self, player: Instance, gamePassId: number, success: boolean): nil
	function SignalPromptPremiumPurchaseFinished(self, didTryPurchasing: boolean): nil
	function SignalPromptProductPurchaseFinished(self, userId: number, productId: number, success: boolean): nil
	function SignalPromptPurchaseFinished(self, player: Instance, assetId: number, success: boolean): nil
	function SignalServerLuaDialogClosed(self, value: boolean): nil
	function UserOwnsGamePassAsync(self, userId: number, gamePassId: number): boolean

	function SetProductInfoUrl(self, url: string): nil
	function SetPlayerOwnsAssetUrl(self, url: string): nil
end




declare class Mouse extends Instance
	Button1Down: RBXScriptSignal<>
	Button1Up: RBXScriptSignal<>
	Button2Down: RBXScriptSignal<>
	Button2Up: RBXScriptSignal<>
	Hit: CFrame
	Icon: Content
	Idle: RBXScriptSignal<>
	Move: RBXScriptSignal<>
	Origin: CFrame
	Target: BasePart
	TargetFilter: Instance
	TargetSurface: EnumNormalId
	UnitRay: Ray
	ViewSizeX: number
	ViewSizeY: number
	WheelBackward: RBXScriptSignal<>
	WheelForward: RBXScriptSignal<>
	X: number
	Y: number
end

declare class PlayerMouse extends Mouse
end

declare class PluginMouse extends Mouse
	DragEnter: RBXScriptSignal<{ Instance }>
end

declare class MouseService extends Instance
	MouseEnterStudioViewport: RBXScriptSignal<>
	MouseLeaveStudioViewport: RBXScriptSignal<>
end

declare class NetworkMarker extends Instance
	Received: RBXScriptSignal<>
end

declare class NetworkPeer extends Instance
	function SetOutgoingKBPSLimit(self, limit: number): nil
end

declare class NetworkClient extends NetworkPeer
	ConnectionAccepted: RBXScriptSignal<string, Instance>
	ConnectionRejected: RBXScriptSignal<string>
	ConnectionFailed: RBXScriptSignal<string, number, string>
	function Connect(self, serverAddress: string, serverPort: number, id: number, threadSleepTime: number): nil
	function Disconnect(self, blockDuration: number?): nil
	function PlayerConnect(self, userId: number, server: string, serverPort: number, clientPort: number?, threadSleepTime: number?, userName: string?): Player
end

declare class NetworkServer extends NetworkPeer
	function EncryptStringForPlayerId(self, toEncrypt: string, playerId: number): string
	function SetIsPlayerAuthenticationRequired(self, value: boolean): nil
	function Start(self): nil
end

declare class NetworkReplicator extends Instance
	function GetPlayer(self): Instance
end

declare class ClientReplicator extends NetworkReplicator
	RCCProfilerDataComplete: RBXScriptSignal<boolean, string>
	StatsReceived: RBXScriptSignal<{ [any]: any }>
	function RequestRCCProfilerData(self, frameRate: number, timeFrame: number): nil
	function RequestServerScriptProfiling(self, start: boolean, frequency: number?): nil
	function RequestServerStats(self, request: boolean): nil
end

declare class ServerReplicator extends NetworkReplicator
end

declare class NetworkSettings extends Instance
	EmulatedTotalMemoryInMB: number
	FreeMemoryMBytes: number
	HttpProxyEnabled: boolean
	HttpProxyURL: string
	IncomingReplicationLag: number
	PrintJoinSizeBreakdown: boolean
	PrintPhysicsErrors: boolean
	PrintStreamInstanceQuota: boolean
	RandomizeJoinInstanceOrder: boolean
	RenderStreamedRegions: boolean
	ShowActiveAnimationAsset: boolean

	PhysicsSend: number
	WaitingForCharacterLogRate: number
	ExperimentalPhysicsEnabled: boolean
	UseInstancePacketCache: boolean
	UsePhysicsPacketCache: boolean
	MtuOverride: number
end

declare class PVInstance extends Instance
	Origin: CFrame
	function GetPivot(self): CFrame
	function PivotTo(self, targetCFrame: CFrame): nil
end

declare class BasePart extends PVInstance
	Anchored: boolean
	AssemblyAngularVelocity: Vector3
	AssemblyCenterOfMass: Vector3
	AssemblyLinearVelocity: Vector3
	AssemblyMass: number
	AssemblyRootPart: BasePart
	BackSurface: EnumSurfaceType
	BottomSurface: EnumSurfaceType
	BrickColor: BrickColor
	CFrame: CFrame
	CanCollide: boolean
	Color: Color3
	FrontSurface: EnumSurfaceType
	LeftSurface: EnumSurfaceType
	LocalTransparencyModifier: number
	Locked: boolean
	Mass: number
	Massless: boolean
	Material: EnumMaterial
	MaterialVariant: string
	Position: Vector3
	ReceiveAge: number
	Reflectance: number
	ResizeIncrement: number
	ResizeableFaces: Faces
	RightSurface: EnumSurfaceType
	RootPriority: number
	Rotation: Vector3
	Size: Vector3
	TopSurface: EnumSurfaceType
	TouchEnded: RBXScriptSignal<BasePart>
	Touched: RBXScriptSignal<BasePart>
	Transparency: number
	function GetConnectedParts(self, recursive: boolean?): { BasePart }
	function GetJoints(self): { BasePart }
	function GetMass(self): number
	function GetRootPart(self): BasePart
	function GetTouchingParts(self): { BasePart }
	function GetVelocityAtPosition(self, position: Vector3): Vector3
	function IsGrounded(self): boolean
	function Resize(self, normalId: EnumNormalId, deltaAmount: number): boolean
end

declare class CornerWedgePart extends BasePart
end

declare class FormFactorPart extends BasePart
end

declare class Part extends FormFactorPart
	Shape: EnumPartType
end



declare class Platform extends Part
end

declare class Seat extends Part
	Disabled: boolean
	Occupant: Humanoid?
	function Sit(self, humanoid: Humanoid): nil
end



declare class SpawnLocation extends Part
	AllowTeamChangeOnTouch: boolean
	Duration: number
	Enabled: boolean
	Neutral: boolean
	TeamColor: BrickColor
end

declare class WedgePart extends FormFactorPart
end

declare class Terrain extends BasePart
	Decoration: boolean
	MaterialColors: BinaryString
	MaxExtents: Region3int16
	ShorelinesUpgraded: boolean
	SmoothVoxelsUpgraded: boolean
	WaterColor: Color3
	WaterReflectance: number
	WaterTransparency: number
	WaterWaveSize: number
	WaterWaveSpeed: number
	function CanShorelinesBeUpgraded(self): boolean
	function CanSmoothVoxelsBeUpgraded(self): boolean
	function CellCenterToWorld(self, x: number, y: number, z: number): Vector3
	function CellCornerToWorld(self, x: number, y: number, z: number): Vector3
	function Clear(self): nil
	function CopyRegion(self, region: Region3int16): TerrainRegion
	function CountCells(self): number
	function FillBall(self, center: Vector3, radius: number, material: EnumMaterial): nil
	function FillBlock(self, cframe: CFrame, size: Vector3, material: EnumMaterial): nil
	function FillCylinder(self, cframe: CFrame, height: number, radius: number, material: EnumMaterial): nil
	function FillRegion(self, region: Region3, resolution: number, material: EnumMaterial): nil
	function FillWedge(self, cframe: CFrame, size: Vector3, material: EnumMaterial): nil
	function GetMaterialColor(self, material: EnumMaterial): Color3
	function GetTerrainWireframe(self, cframe: CFrame, size: Vector3): { any }
	function PasteRegion(self, region: TerrainRegion, corner: Vector3int16, pasteEmptyCells: boolean): nil
	function ReadVoxels(self, region: Region3, resolution: number): any
	function ReplaceMaterial(self, region: Region3, resolution: number, sourceMaterial: EnumMaterial, targetMaterial: EnumMaterial): nil
	function ReplaceMaterialInTransform(self, cframe: CFrame, size: Vector3, sourceMaterial: EnumMaterial, targetMaterial: EnumMaterial): nil
	function ReplaceMaterialInTransformSubregion(self, cframe: CFrame, size: Vector3, sourceMaterial: EnumMaterial, targetMaterial: EnumMaterial, targetRegion: Region3int16): nil
	function SetMaterialColor(self, material: EnumMaterial, value: Color3): nil
	function SetMaterialInTransform(self, cframe: CFrame, size: Vector3, targetMaterial: EnumMaterial): nil
	function SetMaterialInTransformSubregion(self, cframe: CFrame, size: Vector3, targetMaterial: EnumMaterial, targetRegion: Region3int16): nil
	function SmoothRegion(self, region: Region3, resolution: number, strength: number): any
	function WorldToCell(self, position: Vector3): Vector3
	function WorldToCellPreferEmpty(self, position: Vector3): Vector3
	function WorldToCellPreferSolid(self, position: Vector3): Vector3
	function WriteVoxels(self, region: Region3, resolution: number, materials: { any }, occupancy: { any }): nil

	function AutoWedgeCell(self, x: number, y: number, z: number): boolean
	function SetWaterCell(self, x: number, y: number, z: number, waterForce: EnumWaterForce, waterDirection: EnumWaterDirection): nil
	function SetCell(self, x: number, y: number, z: number, material: EnumCellMaterial, orientation: EnumCellOrientation): nil
	function GetCell(self, x: number, y: number, z: number): any -- "tuple" bruh
end

declare class TrussPart extends BasePart
	Style: EnumStyle
end

declare class VehicleSeat extends BasePart
	AreHingesDetected: number
	Disabled: boolean
	HeadsUpDisplay: boolean
	MaxSpeed: number
	Occupant: Humanoid?
	Steer: number
	SteerFloat: number
	Throttle: number
	ThrottleFloat: number
	Torque: number
	TurnSpeed: number
	function Sit(self, humanoid: Humanoid): nil
end

declare class Model extends PVInstance
	LevelOfDetail: EnumModelLevelOfDetail
	PrimaryPart: BasePart?
	Scale: number
	WorldPivot: CFrame
	function AddPersistentPlayer(self, playerInstance: Player?): nil
	function GetBoundingBox(self): (CFrame, Vector3)
	function GetExtentsSize(self): Vector3
	function GetPersistentPlayers(self): { Instance }
	function GetScale(self): number
	function MoveTo(self, position: Vector3): nil
	function RemovePersistentPlayer(self, playerInstance: Player?): nil
	function ScaleTo(self, newScaleFactor: number): nil
	function TranslateBy(self, delta: Vector3): nil

	function GetModelCFrame(self): CFrame
end

declare class BackpackItem extends Model
	TextureId: Content
end



declare class Tool extends BackpackItem
	Activated: RBXScriptSignal<>
	CanBeDropped: boolean
	Deactivated: RBXScriptSignal<>
	Enabled: boolean
	Equipped: RBXScriptSignal<Mouse>
	Grip: CFrame
	GripForward: Vector3
	GripPos: Vector3
	GripRight: Vector3
	GripUp: Vector3
	ManualActivationOnly: boolean
	RequiresHandle: boolean
	ToolTip: string
	Unequipped: RBXScriptSignal<>
	function Activate(self): nil
	function Deactivate(self): nil
end






declare class Workspace extends Model
	AirDensity: number
	AllowThirdPartySales: boolean
	CurrentCamera: Camera
	DistributedGameTime: number
	FallenPartsDestroyHeight: number
	FluidForces: EnumFluidForces
	GlobalWind: Vector3
	Gravity: number
	HumanoidOnlySetCollisionsOnStateChange: EnumHumanoidOnlySetCollisionsOnStateChange
	InterpolationThrottling: EnumInterpolationThrottlingMode
	MeshPartHeadsAndAccessories: EnumMeshPartHeadsAndAccessories
	PersistentLoaded: RBXScriptSignal<Player>
	PhysicsSteppingMethod: EnumPhysicsSteppingMethod
	Retargeting: EnumAnimatorRetargetingMode
	SignalBehavior: EnumSignalBehavior
	StreamOutBehavior: EnumStreamOutBehavior
	StreamingEnabled: boolean
	StreamingIntegrityMode: EnumStreamingIntegrityMode
	StreamingMinRadius: number
	StreamingTargetRadius: number
	Terrain: Terrain
	TouchesUseCollisionGroups: boolean
	function CalculateJumpDistance(self, gravity: number, jumpPower: number, walkSpeed: number): number
	function CalculateJumpHeight(self, gravity: number, jumpPower: number): number
	function CalculateJumpPower(self, gravity: number, jumpHeight: number): number
	function ExperimentalSolverIsEnabled(self): boolean
	function GetNumAwakeParts(self): number
	function GetPhysicsThrottling(self): number
	function GetRealPhysicsFPS(self): number
	function GetServerTimeNow(self): number
	function JoinToOutsiders(self, objects: { Instance }, jointType: EnumJointCreationMode): nil
	function PGSIsEnabled(self): boolean
	function SetMeshPartHeadsAndAccessories(self, value: EnumMeshPartHeadsAndAccessories): nil
	function SetPhysicsThrottleEnabled(self, value: boolean): nil
	function UnjoinFromOutsiders(self, objects: { Instance }): nil
	function ZoomToExtents(self): nil

	function FindPartsInRegion3(self, region: Region3, ignoreDescendantsInstance: Instance, maxParts: number): { BasePart }
end

declare class PausedState extends Instance
	AllThreadsPaused: boolean
	Reason: EnumDebuggerPauseReason
	ThreadId: number
end

declare class PausedStateBreakpoint extends PausedState
	Breakpoint: Breakpoint
end

declare class PausedStateException extends PausedState
	ExceptionText: string
end

declare class PhysicsService extends Instance
	function CollisionGroupSetCollidable(self, name1: string, name2: string, collidable: boolean): nil
	function CollisionGroupsAreCollidable(self, name1: string, name2: string): boolean
	function GetMaxCollisionGroups(self): number
	function GetRegisteredCollisionGroups(self): { any }
	function IkSolve(self, part: BasePart, target: CFrame, translateStiffness: number, rotateStiffness: number): nil
	function IsCollisionGroupRegistered(self, name: string): boolean
	function LocalIkSolve(self, part: BasePart, target: CFrame, translateStiffness: number, rotateStiffness: number): nil
	function RegisterCollisionGroup(self, name: string): nil
	function RenameCollisionGroup(self, from: string, to: string): nil
	function UnregisterCollisionGroup(self, name: string): nil
end

declare class PhysicsSettings extends Instance
	AllowSleep: boolean
	AreAnchorsShown: boolean
	AreAssembliesShown: boolean
	AreAwakePartsHighlighted: boolean
	AreBodyTypesShown: boolean
	AreContactPointsShown: boolean
	AreJointCoordinatesShown: boolean
	AreMechanismsShown: boolean
	AreModelCoordsShown: boolean
	AreOwnersShown: boolean
	ArePartCoordsShown: boolean
	AreRegionsShown: boolean
	AreUnalignedPartsShown: boolean
	AreWorldCoordsShown: boolean
	IsReceiveAgeShown: boolean
	IsTreeShown: boolean
	PhysicsEnvironmentalThrottle: EnumEnviromentalPhysicsThrottle
	ThrottleAdjustTime: number
end

declare class Player extends Instance
	AccountAge: number
	AutoJumpEnabled: boolean
	CameraMaxZoomDistance: number
	CameraMinZoomDistance: number
	CameraMode: EnumCameraMode
	CanLoadCharacterAppearance: boolean
	Character: Model?
	CharacterAdded: RBXScriptSignal<Model>
	CharacterAppearance: string
	CharacterAppearanceId: number
	CharacterAppearanceLoaded: RBXScriptSignal<Model>
	CharacterRemoving: RBXScriptSignal<Model>
	ChatMode: EnumChatMode
	Chatted: RBXScriptSignal<string, Player?>
	DevCameraOcclusionMode: EnumDevCameraOcclusionMode
	DevComputerCameraMode: EnumDevComputerCameraMovementMode
	DevComputerMovementMode: EnumDevComputerMovementMode
	DevEnableMouseLock: boolean
	DevTouchCameraMode: EnumDevTouchCameraMovementMode
	DevTouchMovementMode: EnumDevTouchMovementMode
	DisplayName: string
	FollowUserId: number
	FriendStatusChanged: RBXScriptSignal<Player, EnumFriendStatus>
	GameplayPaused: boolean
	Guest: boolean
	HasVerifiedBadge: boolean
	HealthDisplayDistance: number
	Idled: RBXScriptSignal<number>
	LocaleId: string
	MaximumSimulationRadius: number
	MembershipType: EnumMembershipType
	NameDisplayDistance: number
	Neutral: boolean
	OnTeleport: RBXScriptSignal<EnumTeleportState, number, string>
	OsPlatform: string
	PlatformName: string
	ReplicationFocus: Instance
	RespawnLocation: SpawnLocation
	SimulationRadius: number
	SimulationRadiusChanged: RBXScriptSignal<number>
	Team: Team
	TeamColor: BrickColor
	Teleported: boolean
	TeleportedIn: boolean
	UnfilteredChat: boolean
	userId: number

	Backpack: Backpack
	PlayerGui: PlayerGui

	function AddToBlockList(self, userIds: { any }): nil
	function ClearCharacterAppearance(self): nil
	function DistanceFromCharacter(self, point: Vector3): number
	function GetFriendStatus(self, player: Player): EnumFriendStatus
	function GetFriendsOnline(self, maxFriends: number?): { any }
	function GetGameSessionID(self): string
	function GetJoinData(self): { [any]: any }
	function GetMouse(self): Mouse
	function GetNetworkPing(self): number
	function GetRankInGroup(self, groupId: number): number
	function GetRoleInGroup(self, groupId: number): string
	function GetUnder13(self): boolean
	function HasAppearanceLoaded(self): boolean
	function IsFriendsWith(self, userId: number): boolean
	function IsInGroup(self, groupId: number): boolean
	function IsVerified(self): boolean
	function Kick(self, message: string?): nil
	function LoadCharacter(self, inGame: boolean): nil
	function LoadCharacterBlocking(self): nil
	function Move(self, walkDirection: Vector3, relativeToCamera: boolean?): nil
	function RemoveCharacter(self): nil
	function RequestFriendship(self, player: Player): nil
	function RequestStreamAroundAsync(self, position: Vector3, timeOut: number?): nil
	function RevokeFriendship(self, player: Player): nil
	function SetAccountAge(self, accountAge: number): nil
	function SetCharacterAppearanceJson(self, jsonBlob: string): nil
	function SetExperienceSettingsLocaleId(self, locale: string): nil
	function SetMembershipType(self, membershipType: EnumMembershipType): nil
	function SetModerationAccessKey(self, moderationAccessKey: string): nil
	function SetSuperSafeChat(self, value: boolean): nil
	function UpdatePlayerBlocked(self, userId: number, blocked: boolean): nil
	
	function SetUnder13(self, value: boolean): nil
end

declare class PlayerScripts extends Instance
	ComputerCameraMovementModeRegistered: RBXScriptSignal<>
	ComputerMovementModeRegistered: RBXScriptSignal<>
	TouchCameraMovementModeRegistered: RBXScriptSignal<>
	TouchMovementModeRegistered: RBXScriptSignal<>
	function ClearComputerCameraMovementModes(self): nil
	function ClearComputerMovementModes(self): nil
	function ClearTouchCameraMovementModes(self): nil
	function ClearTouchMovementModes(self): nil
	function GetRegisteredComputerCameraMovementModes(self): { any }
	function GetRegisteredComputerMovementModes(self): { any }
	function GetRegisteredTouchCameraMovementModes(self): { any }
	function GetRegisteredTouchMovementModes(self): { any }
	function RegisterComputerCameraMovementMode(self, cameraMovementMode: EnumComputerCameraMovementMode): nil
	function RegisterComputerMovementMode(self, movementMode: EnumComputerMovementMode): nil
	function RegisterTouchCameraMovementMode(self, cameraMovementMode: EnumTouchCameraMovementMode): nil
	function RegisterTouchMovementMode(self, movementMode: EnumTouchMovementMode): nil
end

declare class Players extends Instance
	BubbleChat: boolean
	CharacterAutoLoads: boolean
	ClassicChat: boolean
	FriendRequestEvent: RBXScriptSignal<Player, Player, EnumFriendRequestEvent>
	GameAnnounce: RBXScriptSignal<string>
	LocalPlayer: Player
	MaxPlayers: number
	MaxPlayersInternal: number
	PlayerAdded: RBXScriptSignal<Player>
	PlayerChatted: RBXScriptSignal<EnumPlayerChatType, Player, string, Player?>
	PlayerConnecting: RBXScriptSignal<Player>
	PlayerDisconnecting: RBXScriptSignal<Player>
	PlayerMembershipChanged: RBXScriptSignal<Player>
	PlayerRejoining: RBXScriptSignal<Player>
	PlayerRemoving: RBXScriptSignal<Player>
	PreferredPlayers: number
	PreferredPlayersInternal: number
	RespawnTime: number
	UseStrafingAnimations: boolean
	function Chat(self, message: string): nil
	function CreateHumanoidModelFromUserId(self, userId: number): Model
	function CreateLocalPlayer(self, id: number): Player
	function GetCharacterAppearanceInfoAsync(self, userId: number): { [any]: any }
	function GetFriendsAsync(self, userId: number): FriendPages
	function GetNameFromUserIdAsync(self, userId: number): string
	function GetPlayerByUserId(self, userId: number): Player?
	function GetPlayerFromCharacter(self, character: Model): Player?
	function GetPlayers(self): { Player }
	function GetUserIdFromNameAsync(self, userName: string): number
	function GetUserThumbnailAsync(self, userId: number, thumbnailType: EnumThumbnailType, thumbnailSize: EnumThumbnailSize): (string, boolean)
	function ReportAbuse(self, player: Player, reason: string, optionalMessage: string): nil
	function ReportAbuseV3(self, player: Player, jsonTags: string): nil
	function ResetLocalPlayer(self): nil
	function SetChatStyle(self, style: EnumChatStyle?): nil
	function SetLocalPlayerInfo(self, userId: number, userName: string, displayName: string, membershipType: EnumMembershipType, isUnder13: boolean): nil
	function TeamChat(self, message: string): nil
	function WhisperChat(self, message: string, player: Instance): nil

	function SetAbuseReportUrl(self, url: string): nil
end

declare class Plugin extends Instance
	CollisionEnabled: boolean
	Deactivation: RBXScriptSignal<>
	GridSize: number
	ProcessAssetInsertionDrag: (assetId: string, assetTypeId: number, instances: { Instance }) -> { Instance }
	ProcessAssetInsertionDrop: () -> nil
	Ready: RBXScriptSignal<>
	Unloading: RBXScriptSignal<>
	UsesAssetInsertionDrag: boolean
	function Activate(self, exclusiveMouse: boolean): nil
	function CreateToolbar(self, name: string): PluginToolbar
	function Deactivate(self): nil
	function GetMouse(self): PluginMouse
	function GetSetting(self, key: string): any
	function SaveSelectedToRoblox(self): nil
	function SetSetting(self, key: string, value: any): nil
end

declare class PluginDebugService extends Instance
end

declare class PluginManager extends Instance
	function ExportPlace(self, filePath: string?): nil
	function ExportSelection(self, filePath: string?): nil
	function CreatePlugin(self): Plugin
end

declare class PluginManagerInterface extends Instance
	function ExportPlace(self, filePath: string?): nil
	function ExportSelection(self, filePath: string?): nil
end

declare class PluginToolbar extends Instance
	function CreateButton(self, id: string, toolTip: string, iconAsset: string, text: string?): PluginToolbarButton
	function CreatePopupButton(self, buttonId: string, tooltip: string, iconname: string, text: string?): Instance
end

declare class PluginToolbarButton extends Instance
	Click: RBXScriptSignal<>
	ClickableWhenViewportHidden: boolean
	DropdownClick: RBXScriptSignal<>
	Enabled: boolean
	Icon: Content
	function SetActive(self, active: boolean): nil
end



declare class PoseBase extends Instance
	EasingDirection: EnumPoseEasingDirection
	EasingStyle: EnumPoseEasingStyle
	Weight: number
end

declare class Pose extends PoseBase
	CFrame: CFrame
	function AddSubPose(self, pose: Pose): nil
	function GetSubPoses(self): { Instance }
	function RemoveSubPose(self, pose: Pose): nil
end

declare class ReflectionMetadata extends Instance
end

declare class ReflectionMetadataCallbacks extends Instance
end

declare class ReflectionMetadataClasses extends Instance
end

declare class ReflectionMetadataEnums extends Instance
end

declare class ReflectionMetadataEvents extends Instance
end

declare class ReflectionMetadataFunctions extends Instance
end

declare class ReflectionMetadataItem extends Instance
	Browsable: boolean
	ClassCategory: string
	ClientOnly: boolean
	Constraint: string
	Deprecated: boolean
	EditingDisabled: boolean
	EditorType: string
	FFlag: string
	IsBackend: boolean
	PropertyOrder: number
	ScriptContext: string
	ServerOnly: boolean
	SliderScaling: string
	UIMaximum: number
	UIMinimum: number
	UINumTicks: number
end

declare class ReflectionMetadataClass extends ReflectionMetadataItem
	ExplorerImageIndex: number
	ExplorerOrder: number
	Insertable: boolean
	PreferredParent: string
	ServiceVisibility: EnumServiceVisibility
end

declare class ReflectionMetadataEnum extends ReflectionMetadataItem
end

declare class ReflectionMetadataEnumItem extends ReflectionMetadataItem
end

declare class ReflectionMetadataMember extends ReflectionMetadataItem
end

declare class ReflectionMetadataProperties extends Instance
end

declare class ReflectionMetadataYieldFunctions extends Instance
end

declare class RemoteDebuggerServer extends Instance
end

declare class RemoteEvent extends Instance
	OnClientEvent: RBXScriptSignal<...any>
	OnServerEvent: RBXScriptSignal<(Player, ...any)>
	function FireAllClients(self, ...: any): ()
	function FireClient(self, player: Player, ...: any): ()
	function FireServer(self, ...: any): ()
end

declare class RemoteFunction extends Instance
	OnClientInvoke: (...any) -> ...any
	OnServerInvoke: (player: Player, ...any) -> ...any
	function InvokeClient(self, player: Player, ...: any): ...any
	function InvokeServer(self, ...: any): ...any
end

declare class RenderSettings extends Instance
	AutoFRMLevel: number
	EagerBulkExecution: boolean
	EditQualityLevel: EnumQualityLevel
	EnableFRM: boolean
	ExportMergeByMaterial: boolean
	FrameRateManager: EnumFramerateManagerMode
	GraphicsMode: EnumGraphicsMode
	MeshCacheSize: number
	MeshPartDetailLevel: EnumMeshPartDetailLevel
	QualityLevel: EnumQualityLevel
	ReloadAssets: boolean
	RenderCSGTrianglesDebug: boolean
	ShowBoundingBoxes: boolean
	ViewMode: EnumViewMode
	function GetMaxQualityLevel(self): number
end

declare class ReplicatedStorage extends Instance
end


declare class RunService extends Instance
	Heartbeat: RBXScriptSignal<number>
	RenderStepped: RBXScriptSignal<number>
	Stepped: RBXScriptSignal<number, number>
	function Pause(self): nil
	function Run(self): nil
	function Stop(self): nil
end

declare class RuntimeScriptService extends Instance
end

declare class ScriptContext extends Instance
	Error: RBXScriptSignal<string, string, Instance>
	ScriptsDisabled: boolean
	function SetTimeout(self, seconds: number): nil

	-- player or instance
	function AddCoreScript(self, assetId: number, parent: Instance, name: string): nil
	function AddStarterScript(self, assetId: number): nil
	function RegisterLibrary(self, libraryName: string, assetId: string): nil
	function LibraryRegistrationComplete(self): nil
end

declare class ScriptDebugger extends Instance
	BreakpointAdded: RBXScriptSignal<Instance>
	BreakpointRemoved: RBXScriptSignal<Instance>
	CurrentLine: number
	EncounteredBreak: RBXScriptSignal<number>
	IsDebugging: boolean
	IsPaused: boolean
	Resuming: RBXScriptSignal<>
	Script: Instance
	WatchAdded: RBXScriptSignal<Instance>
	WatchRemoved: RBXScriptSignal<Instance>
	function AddWatch(self, expression: string): Instance
	function GetBreakpoints(self): { Instance }
	function GetGlobals(self, stackFrame: number?): { [any]: any }
	function GetLocals(self, stackFrame: number?): { [any]: any }
	function GetStack(self): { any }
	function GetUpvalues(self, stackFrame: number?): { [any]: any }
	function GetWatchValue(self, watch: Instance): any
	function GetWatches(self): { Instance }
	function SetBreakpoint(self, line: number, isContextDependentBreakpoint: boolean): Instance
	function SetGlobal(self, name: string, value: any, stackFrame: number): nil
	function SetLocal(self, name: string, value: any, stackFrame: number?): nil
	function SetUpvalue(self, name: string, value: any, stackFrame: number?): nil
end

declare class ScriptService extends Instance
end

declare class Selection extends Instance
	ActiveInstance: Instance
	RenderMode: EnumSelectionRenderMode
	SelectionBoxThickness: number
	SelectionChanged: RBXScriptSignal<>
	SelectionLineThickness: number
	SelectionThickness: number
	ShowActiveInstanceHighlight: boolean
	function Add(self, instancesToAdd: { Instance }): nil
	function ClearTerrainSelectionHack(self): nil
	function Get(self): { Instance }
	function Remove(self, instancesToRemove: { Instance }): nil
	function Set(self, selection: { Instance }): nil
	function SetTerrainSelectionHack(self, center: Vector3, size: Vector3): nil
end

declare class ServerScriptService extends Instance
	LoadStringEnabled: boolean
end

declare class ServerStorage extends Instance
end

declare class ThumbnailGenerator extends Instance -- Tap in rcc before carrot gets it
	function Click(self, format: "PNG" | "OBJ", x: number, y: number, hideSky: boolean, crop: boolean?): string
end

declare class ServiceProvider extends Instance
	Close: RBXScriptSignal<>
	CloseLate: RBXScriptSignal<>
	ServiceAdded: RBXScriptSignal<Instance>
	ServiceRemoving: RBXScriptSignal<Instance>

	AnimationClipProvider: AnimationClipProvider
	AppStorageService: AppStorageService
	AppUpdateService: AppUpdateService
	AssetCounterService: AssetCounterService
	AssetDeliveryProxy: AssetDeliveryProxy
	AssetService: AssetService
	BadgeService: BadgeService
	BrowserService: BrowserService
	BulkImportService: BulkImportService
	CSGDictionaryService: CSGDictionaryService
	CacheableContentProvider: CacheableContentProvider
	CalloutService: CalloutService
	CaptureService: CaptureService
	ChangeHistoryService: ChangeHistoryService
	Chat: Chat
	ChatbotUIService: ChatbotUIService
	ClusterPacketCache: ClusterPacketCache
	CollectionService: CollectionService
	ConfigureServerService: ConfigureServerService
	ContentProvider: ContentProvider
	ContextActionService: ContextActionService
	ControllerService: ControllerService
	CookiesService: CookiesService
	CoreGui: CoreGui
	CoreScriptDebuggingManagerHelper: CoreScriptDebuggingManagerHelper
	DataStoreService: DataStoreService
	Debris: Debris
	DebuggerManager: DebuggerManager
	DeviceIdService: DeviceIdService
	EventIngestService: EventIngestService
	FlagStandService: FlagStandService
	FriendService: FriendService
	GamePassService: GamePassService
	GamepadService: GamepadService
	GuiService: GuiService
	GuidRegistryService: GuidRegistryService
	HSRDataContentProvider: HSRDataContentProvider
	HttpService: HttpService
	InsertService: InsertService
	KeyboardService: KeyboardService
	KeyframeSequenceProvider: KeyframeSequenceProvider
	LanguageService: LanguageService
	Lighting: Lighting
	LocalStorageService: LocalStorageService
	LodDataService: LodDataService
	LoginService: LoginService
	LuaWebService: LuaWebService
	MarketplaceService: MarketplaceService
	MaterialGenerationService: MaterialGenerationService
	MeshContentProvider: MeshContentProvider
	MouseService: MouseService
	NetworkClient: NetworkClient
	NetworkServer: NetworkServer
	NetworkSettings: NetworkSettings
	PhysicsService: PhysicsService
	Players: Players
	PluginDebugService: PluginDebugService
	RemoteDebuggerServer: RemoteDebuggerServer
	RenderSettings: RenderSettings
	ReplicatedStorage: ReplicatedStorage
	RunService: RunService
	RuntimeScriptService: RuntimeScriptService
	ScriptContext: ScriptContext
	ScriptService: ScriptService
	Selection: Selection
	ServerScriptService: ServerScriptService
	ServerStorage: ServerStorage
	SocialService: SocialService
	SoundService: SoundService
	SpawnerService: SpawnerService
	StarterGui: StarterGui
	StarterPack: StarterPack
	StarterPlayer: StarterPlayer
	Stats: Stats
	Studio: Studio
	StudioScriptDebugEventListener: StudioScriptDebugEventListener
	TaskScheduler: TaskScheduler
	TeamCreateData: TeamCreateData
	TeamCreateService: TeamCreateService
	Teams: Teams
	TeleportService: TeleportService
	TestService: TestService
	TimerService: TimerService
	UserInputService: UserInputService
	UserStorageService: UserStorageService
	VersionControlService: VersionControlService
	VideoCaptureService: VideoCaptureService
	VideoService: VideoService
	VirtualUser: VirtualUser
	Visit: Visit
	Workspace: Workspace

	LoadingGuiService: any
	ScriptInformationProvider: ScriptInformationProvider
	JointsService: JointsService
	ThumbnailGenerator: ThumbnailGenerator

	function FindService(self, className: string): Instance
	function GetService(self, service: "AnimationClipProvider"): AnimationClipProvider
	function GetService(self, service: "AppStorageService"): AppStorageService
	function GetService(self, service: "AppUpdateService"): AppUpdateService
	function GetService(self, service: "AssetCounterService"): AssetCounterService
	function GetService(self, service: "AssetDeliveryProxy"): AssetDeliveryProxy
	function GetService(self, service: "AssetService"): AssetService
	function GetService(self, service: "BadgeService"): BadgeService
	function GetService(self, service: "BrowserService"): BrowserService
	function GetService(self, service: "BulkImportService"): BulkImportService
	function GetService(self, service: "CSGDictionaryService"): CSGDictionaryService
	function GetService(self, service: "CacheableContentProvider"): CacheableContentProvider
	function GetService(self, service: "CalloutService"): CalloutService
	function GetService(self, service: "CaptureService"): CaptureService
	function GetService(self, service: "ChangeHistoryService"): ChangeHistoryService
	function GetService(self, service: "Chat"): Chat
	function GetService(self, service: "ChatbotUIService"): ChatbotUIService
	function GetService(self, service: "ClusterPacketCache"): ClusterPacketCache
	function GetService(self, service: "CollectionService"): CollectionService
	function GetService(self, service: "ConfigureServerService"): ConfigureServerService
	function GetService(self, service: "ContentProvider"): ContentProvider
	function GetService(self, service: "ContextActionService"): ContextActionService
	function GetService(self, service: "ControllerService"): ControllerService
	function GetService(self, service: "CookiesService"): CookiesService
	function GetService(self, service: "CoreGui"): CoreGui
	function GetService(self, service: "CoreScriptDebuggingManagerHelper"): CoreScriptDebuggingManagerHelper
	function GetService(self, service: "DataStoreService"): DataStoreService
	function GetService(self, service: "Debris"): Debris
	function GetService(self, service: "DebuggerManager"): DebuggerManager
	function GetService(self, service: "DeviceIdService"): DeviceIdService
	function GetService(self, service: "EventIngestService"): EventIngestService
	function GetService(self, service: "FlagStandService"): FlagStandService
	function GetService(self, service: "FriendService"): FriendService
	function GetService(self, service: "GamePassService"): GamePassService
	function GetService(self, service: "GamepadService"): GamepadService
	function GetService(self, service: "GuiService"): GuiService
	function GetService(self, service: "GuidRegistryService"): GuidRegistryService
	function GetService(self, service: "HSRDataContentProvider"): HSRDataContentProvider
	function GetService(self, service: "Hopper"): Hopper
	function GetService(self, service: "HttpService"): HttpService
	function GetService(self, service: "InsertService"): InsertService
	function GetService(self, service: "JointsService"): JointsService
	function GetService(self, service: "KeyboardService"): KeyboardService
	function GetService(self, service: "KeyframeSequenceProvider"): KeyframeSequenceProvider
	function GetService(self, service: "LanguageService"): LanguageService
	function GetService(self, service: "Lighting"): Lighting
	function GetService(self, service: "LocalStorageService"): LocalStorageService
	function GetService(self, service: "LodDataService"): LodDataService
	function GetService(self, service: "LoginService"): LoginService
	function GetService(self, service: "LuaWebService"): LuaWebService
	function GetService(self, service: "MarketplaceService"): MarketplaceService
	function GetService(self, service: "MaterialGenerationService"): MaterialGenerationService
	function GetService(self, service: "MeshContentProvider"): MeshContentProvider
	function GetService(self, service: "MouseService"): MouseService
	function GetService(self, service: "NetworkClient"): NetworkClient
	function GetService(self, service: "NetworkServer"): NetworkServer
	function GetService(self, service: "NetworkSettings"): NetworkSettings
	function GetService(self, service: "PhysicsService"): PhysicsService
	function GetService(self, service: "Players"): Players
	function GetService(self, service: "PluginDebugService"): PluginDebugService
	function GetService(self, service: "PointsService"): PointsService
	function GetService(self, service: "RemoteDebuggerServer"): RemoteDebuggerServer
	function GetService(self, service: "RenderSettings"): RenderSettings
	function GetService(self, service: "ReplicatedStorage"): ReplicatedStorage
	function GetService(self, service: "RunService"): RunService
	function GetService(self, service: "RuntimeScriptService"): RuntimeScriptService
	function GetService(self, service: "ScriptContext"): ScriptContext
	function GetService(self, service: "ScriptService"): ScriptService
	function GetService(self, service: "Selection"): Selection
	function GetService(self, service: "ServerScriptService"): ServerScriptService
	function GetService(self, service: "ServerStorage"): ServerStorage
	function GetService(self, service: "SocialService"): SocialService
	function GetService(self, service: "SoundService"): SoundService
	function GetService(self, service: "SpawnerService"): SpawnerService
	function GetService(self, service: "StarterGui"): StarterGui
	function GetService(self, service: "StarterPack"): StarterPack
	function GetService(self, service: "StarterPlayer"): StarterPlayer
	function GetService(self, service: "Stats"): Stats
	function GetService(self, service: "Studio"): Studio
	function GetService(self, service: "StudioScriptDebugEventListener"): StudioScriptDebugEventListener
	function GetService(self, service: "TaskScheduler"): TaskScheduler
	function GetService(self, service: "TeamCreateData"): TeamCreateData
	function GetService(self, service: "TeamCreateService"): TeamCreateService
	function GetService(self, service: "Teams"): Teams
	function GetService(self, service: "TeleportService"): TeleportService
	function GetService(self, service: "TestService"): TestService
	function GetService(self, service: "TimerService"): TimerService
	function GetService(self, service: "TweenService"): nil
	function GetService(self, service: "UserInputService"): UserInputService
	function GetService(self, service: "UserStorageService"): UserStorageService
	function GetService(self, service: "VersionControlService"): VersionControlService
	function GetService(self, service: "VideoCaptureService"): VideoCaptureService
	function GetService(self, service: "VideoService"): VideoService
	function GetService(self, service: "VirtualUser"): VirtualUser
	function GetService(self, service: "Visit"): Visit
	function GetService(self, service: "Workspace"): Workspace

	function GetService(self, service: "ScriptInformationProvider"): ScriptInformationProvider
	function GetService(self, service: "LoadingGuiService"): any
	function GetService(self, service: "PersonalServerService"): PersonalServerService
	function GetService(self, service: "Terrain"): Terrain
	function GetService(self, service: "ThumbnailGenerator"): ThumbnailGenerator
end

declare class DataModel extends ServiceProvider
	CreatorId: number
	CreatorType: EnumCreatorType
	GameId: number
	Genre: EnumGenre
	GraphicsQualityChangeRequest: RBXScriptSignal<boolean>
	JobId: string
	Loaded: RBXScriptSignal<>
	PlaceId: number
	PlaceVersion: number
	PrivateServerId: string
	PrivateServerOwnerId: number
	ScreenshotReady: RBXScriptSignal<string>
	ScreenshotSavedToAlbum: RBXScriptSignal<string, boolean, string>
	UniverseMetadataLoaded: RBXScriptSignal<>
	Workspace: Workspace

	LocalSaveEnabled: boolean
	RequestShutdown: (...any) -> ...any
	LocalBackpack: Backpack

	function BindToClose(self, func: ((...any) -> ...any)): nil
	function DefineFastFlag(self, name: string, defaultValue: boolean): boolean
	function DefineFastInt(self, name: string, defaultValue: number): number
	function DefineFastString(self, name: string, defaultValue: string): string
	function GetJobsInfo(self): { any }
	function GetObjects(self, url: Content): { Instance }
	function HttpGet(self, url: string, synchronous: boolean?): string
	function HttpGetAsync(self, url: string, synchronous: boolean?): string
	function HttpPost(self, url: string, data: string, synchronous: boolean?): string
	function HttpPostAsync(self, url: string, data: string): string
	function IsContentLoaded(self): boolean
	function IsLoaded(self): boolean
	function Load(self, url: Content): nil
	function SetIsLoaded(self, value: boolean, placeSizeInBytes: number?): nil
	function SetPlaceId(self, placeId: number, idk: boolean?): nil
	function Shutdown(self): nil

	function SaveToRoblox(self): nil
	function FinishShutdown(self, idk: boolean): nil
	function SetScreenshotInfo(self, info: string): nil
	function SetVideoInfo(self, info: string): nil
	function SetRemoteBuildMode(self, value: boolean): nil
	function SetMessage(self, message: string): nil
	function SetMessageBrickCount(self): nil
	function ClearMessage(self): nil
	function SetCreatorID(self, id: number, creatorType: EnumCreatorType): nil
end

declare class GenericSettings extends ServiceProvider
end

declare class UserSettings extends GenericSettings
	GameSettings: UserGameSettings
	function GetService(self, service: "UserGameSettings"): UserGameSettings
	function IsUserFeatureEnabled(self, name: string): boolean
	function Reset(self): nil
	function SaveState(self): nil
end

declare class Sky extends Instance
	CelestialBodiesShown: boolean
	MoonAngularSize: number
	MoonTextureId: Content
	SkyboxBk: Content
	SkyboxDn: Content
	SkyboxFt: Content
	SkyboxLf: Content
	SkyboxRt: Content
	SkyboxUp: Content
	StarCount: number
	SunAngularSize: number
	SunTextureId: Content
end

declare class Smoke extends Instance
	Color: Color3
	Enabled: boolean
	Opacity: number
	RiseVelocity: number
	Size: number
	TimeScale: number
	function FastForward(self, numFrames: number): nil
end

declare class SocialService extends Instance
	function SetGroupRankUrl(self, groupRankUrl: string): nil
	function SetGroupRoleUrl(self, groupRoleUrl: string): nil
	function SetFriendUrl(self, friendUrl: string): nil
	function SetBestFriendUrl(self, bestFriendUrl: string): nil
	function SetStuffUrl(self, stuffUrl: string): nil
	function SetPackageContentsUrl(self, stuffUrl: string): nil
		
	function SetGroupUrl(self, groupUrl: string): nil
end

declare class Sound extends Instance
	ChannelCount: number
	DidLoop: RBXScriptSignal<string, number>
	Ended: RBXScriptSignal<string>
	IsLoaded: boolean
	IsPaused: boolean
	IsPlaying: boolean
	IsSpatial: boolean
	Loaded: RBXScriptSignal<string>
	LoopRegion: NumberRange
	Looped: boolean
	Paused: RBXScriptSignal<string>
	PlayOnRemove: boolean
	PlaybackLoudness: number
	PlaybackRegion: NumberRange
	PlaybackRegionsEnabled: boolean
	PlaybackSpeed: number
	Played: RBXScriptSignal<string>
	Playing: boolean
	Resumed: RBXScriptSignal<string>
	RollOffGain: number
	RollOffMaxDistance: number
	RollOffMinDistance: number
	RollOffMode: EnumRollOffMode
	SoundId: Content
	Stopped: RBXScriptSignal<string>
	TimeLength: number
	TimePosition: number
	UsageContextPermission: EnumUsageContext
	Volume: number
	function Pause(self): nil
	function Play(self): nil
	function Resume(self): nil
	function Stop(self): nil
end

declare class SoundService extends Instance
	AmbientReverb: EnumReverbType
	DeviceListChanged: RBXScriptSignal<any>
	DistanceFactor: number
	DopplerScale: number
	RespectFilteringEnabled: boolean
	RolloffScale: number
	VolumetricAudio: EnumVolumetricAudio
	function BeginRecording(self): boolean
	function EndRecording(self): { [any]: any }
	function GetInputDevice(self): any
	function GetInputDevices(self): any
	function GetListener(self): (EnumListenerType, any)
	function GetOutputDevice(self): any
	function GetOutputDevices(self): any
	function GetRecordingDevices(self): { [any]: any }
	function GetSoundMemoryData(self): { [any]: any }
	function PlayLocalSound(self, sound: Sound): nil
	function SetInputDevice(self, name: string, guid: string): nil
	function SetListener(self, listenerType: EnumListenerType, listener: any): nil
	function SetOutputDevice(self, name: string, guid: string): nil
	function SetRecordingDevice(self, deviceIndex: number): boolean
end

declare class Sparkles extends Instance
	Color: Color3
	Enabled: boolean
	SparkleColor: Color3
	TimeScale: number
	function FastForward(self, numFrames: number): nil
end

declare class SpawnerService extends Instance
end

declare class StackFrame extends Instance
	FrameId: number
	FrameName: string
	FrameType: EnumDebuggerFrameType
	Globals: DebuggerVariable
	Line: number
	Locals: DebuggerVariable
	Populated: boolean
	Script: string
	Upvalues: DebuggerVariable
end

declare class StandalonePluginScripts extends Instance
end

declare class StarterGear extends Instance
end

declare class StarterPack extends Instance
end

declare class StarterPlayer extends Instance
	CameraMaxZoomDistance: number
	CameraMinZoomDistance: number
	CameraMode: EnumCameraMode
	HealthDisplayDistance: number
	NameDisplayDistance: number
end

declare class Stats extends Instance
	ContactsCount: number
	DataReceiveKbps: number
	DataSendKbps: number
	HeartbeatTimeMs: number
	InstanceCount: number
	MovingPrimitivesCount: number
	PhysicsReceiveKbps: number
	PhysicsSendKbps: number
	PhysicsStepTimeMs: number
	PrimitivesCount: number
	function GetBrowserTrackerId(self): string
	function GetMemoryUsageMbForTag(self, tag: EnumDeveloperMemoryTag): number
	function GetPaginatedMemoryByTexture(self, queryType: EnumTextureQueryType, pageIndex: number, pageSize: number): { [any]: any }
	function GetTotalMemoryUsageMb(self): number
end

declare class StatsItem extends Instance
	DisplayName: string
	function GetValue(self): number
	function GetValueString(self): string
end

declare class RunningAverageItemDouble extends StatsItem
end

declare class RunningAverageItemInt extends StatsItem
end

declare class RunningAverageTimeIntervalItem extends StatsItem
end

declare class TotalCountTimeIntervalItem extends StatsItem
end

declare class Studio extends Instance
	CommandBarLocalState: boolean
	DefaultScriptFileDir: QDir
	DeprecatedObjectsShown: boolean
	DisplayLanguage: string
	EnableIndentationRulers: boolean
	EnableOnTypeAutocomplete: boolean
	Font: QFont
	HintColor: Color3
	IconOverrideDir: QDir
	IndentationRulerColor: Color3
	InformationColor: Color3
	LocalAssetsFolder: QDir
	LuaDebuggerEnabled: boolean
	LuaDebuggerEnabledAtStartup: boolean
	PermissionLevelShown: EnumPermissionLevelShown
	PluginDebuggingEnabled: boolean
	PluginsDir: QDir
	ReloadBuiltinPluginsOnChange: boolean
	ReloadLocalPluginsOnChange: boolean
	Rulers: string
	RuntimeUndoBehavior: EnumRuntimeUndoBehavior
	ScriptEditorMenuBorderColor: Color3
	ScriptEditorShouldShowPluginMethods: boolean
	ScriptTimeoutLength: number
end

declare class StudioScriptDebugEventListener extends Instance
end

declare class TaskScheduler extends Instance
	SchedulerDutyCycle: number
	SchedulerRate: number
	ThreadPoolConfig: EnumThreadPoolConfig
	ThreadPoolSize: number
end

declare class Team extends Instance
	AutoAssignable: boolean
	ChildOrder: number
	PlayerAdded: RBXScriptSignal<Player>
	PlayerRemoved: RBXScriptSignal<Player>
	TeamColor: BrickColor
	function GetPlayers(self): { Player }
end

declare class TeamCreateData extends Instance
end

declare class TeamCreateService extends Instance
	ToggleManageCollaborators: RBXScriptSignal<>
	function CloseGameIfUserDoesntHavePerms(self): nil
end

declare class Teams extends Instance
	function GetTeams(self): { Team }
end

declare class TeleportAsyncResult extends Instance
	PrivateServerId: string
	ReservedServerAccessCode: string
end

declare class TeleportOptions extends Instance
	ReservedServerAccessCode: string
	ServerInstanceId: string
	ShouldReserveServer: boolean
	function GetTeleportData(self): any
	function SetTeleportData(self, teleportData: any): nil
end

declare class TeleportService extends Instance
	MenuTeleportAttempt: RBXScriptSignal<>
	function SetTeleportGui(self, gui: GuiObject): nil
	function Teleport(self, placeId: number, player: Player?, teleportData: any, customLoadingScreen: GuiObject?): nil
	function TeleportCancel(self): nil
	function TeleportToSpawnByName(self, placeId: number, spawnName: string, player: Player?, teleportData: any, customLoadingScreen: GuiObject?): nil
end

declare class TerrainRegion extends Instance
	SizeInCells: Vector3
end

declare class TestService extends Instance
	AutoRuns: boolean
	Description: string
	ErrorCount: number
	ExecuteWithStudioRun: boolean
	Is30FpsThrottleEnabled: boolean
	IsPhysicsEnvironmentalThrottled: boolean
	IsSleepAllowed: boolean
	NumberOfPlayers: number
	ServerCollectConditionalResult: RBXScriptSignal<boolean, string, Instance, number>
	ServerCollectResult: RBXScriptSignal<string, Instance, number>
	SimulateSecondsLag: number
	TestCount: number
	Timeout: number
	WarnCount: number
	function Check(self, condition: boolean, description: string, source: Instance?, line: number?): nil
	function Checkpoint(self, text: string, source: Instance?, line: number?): nil
	function Done(self): nil
	function Error(self, description: string, source: Instance?, line: number?): nil
	function Fail(self, description: string, source: Instance?, line: number?): nil
	function Message(self, text: string, source: Instance?, line: number?): nil
	function Require(self, condition: boolean, description: string, source: Instance?, line: number?): nil
	function Run(self): nil
	function ScopeTime(self): { [any]: any }
	function Warn(self, condition: boolean, description: string, source: Instance?, line: number?): nil
	function isFeatureEnabled(self, name: string): boolean
end

declare class TimerService extends Instance
end

declare class TouchTransmitter extends Instance
end

declare class UserGameSettings extends Instance
	AllTutorialsDisabled: boolean
	CameraMode: EnumCustomCameraMode
	CameraYInverted: boolean
	ChatVisible: boolean
	ComputerCameraMovementMode: EnumComputerCameraMovementMode
	ComputerMovementMode: EnumComputerMovementMode
	ControlMode: EnumControlMode
	DefaultCameraID: string
	Fullscreen: boolean
	FullscreenChanged: RBXScriptSignal<boolean>
	GamepadCameraSensitivity: number
	GraphicsQualityLevel: number
	IsUsingCameraYInverted: boolean
	IsUsingGamepadCameraSensitivity: boolean
	MasterVolume: number
	MicroProfilerWebServerEnabled: boolean
	MicroProfilerWebServerIP: string
	MicroProfilerWebServerPort: number
	MouseSensitivity: number
	MouseSensitivityFirstPerson: Vector2
	MouseSensitivityThirdPerson: Vector2
	OnScreenProfilerEnabled: boolean
	OnboardingsCompleted: string
	PerformanceStatsVisible: boolean
	PerformanceStatsVisibleChanged: RBXScriptSignal<boolean>
	PlayerHeight: number
	PreferredTransparency: number
	RCCProfilerRecordFrameRate: number
	RCCProfilerRecordTimeFrame: number
	ReducedMotion: boolean
	RotationType: EnumRotationType
	SavedQualityLevel: EnumSavedQualitySetting
	StartMaximized: boolean
	StartScreenPosition: Vector2
	StartScreenSize: Vector2
	StudioModeChanged: RBXScriptSignal<boolean>
	TouchCameraMovementMode: EnumTouchCameraMovementMode
	TouchMovementMode: EnumTouchMovementMode
	UiNavigationKeyBindEnabled: boolean
	UsedCoreGuiIsVisibleToggle: boolean
	UsedCustomGuiIsVisibleToggle: boolean
	UsedHideHudShortcut: boolean
	VignetteEnabled: boolean

	VideoUploadPromptBehavior: EnumUploadSetting

	function GetCameraYInvertValue(self): number
	function GetOnboardingCompleted(self, onboardingId: string): boolean
	function GetTutorialState(self, tutorialId: string): boolean
	function InFullScreen(self): boolean
	function InStudioMode(self): boolean
	function ResetOnboardingCompleted(self, onboardingId: string): nil
	function SetCameraYInvertVisible(self): nil
	function SetGamepadCameraSensitivityVisible(self): nil
	function SetOnboardingCompleted(self, onboardingId: string): nil
	function SetTutorialState(self, tutorialId: string, value: boolean): nil
end

declare class UserInputService extends Instance
	GamepadEnabled: boolean
	InputBegan: RBXScriptSignal<InputObject, boolean>
	InputChanged: RBXScriptSignal<InputObject, boolean>
	InputEnded: RBXScriptSignal<InputObject, boolean>
	JumpRequest: RBXScriptSignal<>
	KeyboardEnabled: boolean
	LastInputTypeChanged: RBXScriptSignal<EnumUserInputType>
	LegacyInputEventsEnabled: boolean
	MouseDeltaSensitivity: number
	MouseEnabled: boolean
	MouseIcon: Content
	MouseIconEnabled: boolean
	NavBarSize: Vector2
	OnScreenKeyboardAnimationDuration: number
	OnScreenKeyboardPosition: Vector2
	OnScreenKeyboardSize: Vector2
	OnScreenKeyboardVisible: boolean
	PointerAction: RBXScriptSignal<number, Vector2, number, boolean>
	RightBarSize: Vector2
	StatusBarSize: Vector2
	StatusBarTapped: RBXScriptSignal<Vector2>
	TextBoxFocusReleased: RBXScriptSignal<TextBox>
	TextBoxFocused: RBXScriptSignal<TextBox>
	TouchEnabled: boolean
	TouchEnded: RBXScriptSignal<InputObject, boolean>
	TouchLongPress: RBXScriptSignal<{ Vector2 }, EnumUserInputState, boolean>
	TouchMoved: RBXScriptSignal<InputObject, boolean>
	TouchPan: RBXScriptSignal<{ Vector2 }, Vector2, Vector2, EnumUserInputState, boolean>
	TouchPinch: RBXScriptSignal<{ Vector2 }, number, number, EnumUserInputState, boolean>
	TouchRotate: RBXScriptSignal<{ Vector2 }, number, number, EnumUserInputState, boolean>
	TouchStarted: RBXScriptSignal<InputObject, boolean>
	TouchSwipe: RBXScriptSignal<EnumSwipeDirection, number, boolean>
	TouchTap: RBXScriptSignal<{ Vector2 }, boolean>
	TouchTapInWorld: RBXScriptSignal<Vector2, boolean>
	UserCFrameChanged: RBXScriptSignal<EnumUserCFrame, CFrame>
	WindowFocusReleased: RBXScriptSignal<>
	WindowFocused: RBXScriptSignal<>
	function GetConnectedGamepads(self): { EnumUserInputType }
	function GetDeviceAcceleration(self): InputObject
	function GetDeviceGravity(self): InputObject
	function GetDeviceRotation(self): (number, CFrame)
	function GetDeviceType(self): EnumDeviceType
	function GetFocusedTextBox(self): TextBox
	function GetGamepadConnected(self, gamepadNum: EnumUserInputType): boolean
	function GetGamepadState(self, gamepadNum: EnumUserInputType): { InputObject }
	function GetKeysPressed(self): { InputObject }
	function GetLastInputType(self): EnumUserInputType
	function GetMouseButtonsPressed(self): { InputObject }
	function GetMouseDelta(self): Vector2
	function GetMouseLocation(self): Vector2
	function GetNavigationGamepads(self): { EnumUserInputType }
	function GetPlatform(self): EnumPlatform
	function GetUserCFrame(self, type: EnumUserCFrame): CFrame
	function IsMouseButtonPressed(self, mouseButton: EnumUserInputType): boolean
	function IsNavigationGamepad(self, gamepadEnum: EnumUserInputType): boolean
	function RecenterUserHeadCFrame(self): nil
	function SendAppUISizes(self, statusBarSize: Vector2, navBarSize: Vector2, bottomBarSize: Vector2, rightBarSize: Vector2): nil
	function SetNavigationGamepad(self, gamepadEnum: EnumUserInputType, enabled: boolean): nil
end

declare class ValueBase extends Instance
end

declare class BinaryStringValue extends ValueBase
	Changed: RBXScriptSignal<BinaryString>
end

declare class BoolValue extends ValueBase
	Changed: RBXScriptSignal<boolean>
	Value: boolean
end

declare class BrickColorValue extends ValueBase
	Changed: RBXScriptSignal<BrickColor>
	Value: BrickColor
end

declare class CFrameValue extends ValueBase
	Changed: RBXScriptSignal<CFrame>
	Value: CFrame
end

declare class Color3Value extends ValueBase
	Changed: RBXScriptSignal<Color3>
	Value: Color3
end


declare class ScriptInformationProvider extends Instance
	function SetAssetUrl(self, url: string): nil
end

declare class PersonalServerService extends Instance
	function Promote(self, player: Player): nil
	function Demote(self, player: Player): nil
end


declare class IntValue extends ValueBase
	Changed: RBXScriptSignal<number>
	Value: number
end

declare class NumberValue extends ValueBase
	Changed: RBXScriptSignal<number>
	Value: number
end

declare class ObjectValue extends ValueBase
	Changed: RBXScriptSignal<Instance?>
	Value: Instance?
end

declare class RayValue extends ValueBase
	Changed: RBXScriptSignal<Ray>
	Value: Ray
end

declare class StringValue extends ValueBase
	Changed: RBXScriptSignal<string>
	Value: string
end

declare class Vector3Value extends ValueBase
	Changed: RBXScriptSignal<Vector3>
	Value: Vector3
end

declare class VersionControlService extends Instance
	ScriptCollabEnabled: boolean
end

declare class VideoCaptureService extends Instance
	Active: boolean
	CameraID: string
	DevicesChanged: RBXScriptSignal<>
	Error: RBXScriptSignal<string, string>
	Started: RBXScriptSignal<string>
	Stopped: RBXScriptSignal<string>
	function GetCameraDevices(self): { [any]: any }
end

declare class VideoService extends Instance
end

declare class VirtualUser extends Instance
	function Button1Down(self, position: Vector2, camera: CFrame?): nil
	function Button1Up(self, position: Vector2, camera: CFrame?): nil
	function Button2Down(self, position: Vector2, camera: CFrame?): nil
	function Button2Up(self, position: Vector2, camera: CFrame?): nil
	function CaptureController(self): nil
	function ClickButton1(self, position: Vector2, camera: CFrame?): nil
	function ClickButton2(self, position: Vector2, camera: CFrame?): nil
	function MoveMouse(self, position: Vector2, camera: CFrame?): nil
	function SetKeyDown(self, key: string): nil
	function SetKeyUp(self, key: string): nil
	function StartRecording(self): nil
	function StopRecording(self): string
	function TypeKey(self, key: string): nil
end

declare class Visit extends Instance
	function SetPing(self, pingUrl: string, interval: number): nil
	function SetUploadUrl(self, url: string): nil
end

declare class Wire extends Instance
	Connected: boolean
	SourceInstance: Instance
	SourceName: string
	TargetInstance: Instance
	TargetName: string
end

declare Instance: {
	new: ((className: "Accoutrement", parent: Instance?) -> Accoutrement) & ((className: "Hat", parent: Instance?) -> Hat) & ((className: "AdvancedDragger", parent: Instance?) -> AdvancedDragger) & ((className: "Animation", parent: Instance?) -> Animation) & ((className: "CurveAnimation", parent: Instance?) -> CurveAnimation) & ((className: "KeyframeSequence", parent: Instance?) -> KeyframeSequence) & ((className: "AnimationController", parent: Instance?) -> AnimationController) & ((className: "Animator", parent: Instance?) -> Animator) & ((className: "Backpack", parent: Instance?) -> Backpack) & ((className: "BindableEvent", parent: Instance?) -> BindableEvent) & ((className: "BindableFunction", parent: Instance?) -> BindableFunction) & ((className: "BodyAngularVelocity", parent: Instance?) -> BodyAngularVelocity) & ((className: "BodyForce", parent: Instance?) -> BodyForce) & ((className: "BodyGyro", parent: Instance?) -> BodyGyro) & ((className: "BodyPosition", parent: Instance?) -> BodyPosition) & ((className: "BodyThrust", parent: Instance?) -> BodyThrust) & ((className: "BodyVelocity", parent: Instance?) -> BodyVelocity) & ((className: "RocketPropulsion", parent: Instance?) -> RocketPropulsion) & ((className: "BubbleChatMessageProperties", parent: Instance?) -> BubbleChatMessageProperties) & ((className: "Camera", parent: Instance?) -> Camera) & ((className: "BodyColors", parent: Instance?) -> BodyColors) & ((className: "CharacterMesh", parent: Instance?) -> CharacterMesh) & ((className: "Pants", parent: Instance?) -> Pants) & ((className: "Shirt", parent: Instance?) -> Shirt) & ((className: "ShirtGraphic", parent: Instance?) -> ShirtGraphic) & ((className: "Skin", parent: Instance?) -> Skin) & ((className: "ClickDetector", parent: Instance?) -> ClickDetector) & ((className: "DragDetector", parent: Instance?) -> DragDetector) & ((className: "Configuration", parent: Instance?) -> Configuration) & ((className: "AnimationConstraint", parent: Instance?) -> AnimationConstraint) & ((className: "BallSocketConstraint", parent: Instance?) -> BallSocketConstraint) & ((className: "LineForce", parent: Instance?) -> LineForce) & ((className: "LinearVelocity", parent: Instance?) -> LinearVelocity) & ((className: "Torque", parent: Instance?) -> Torque) & ((className: "HumanoidController", parent: Instance?) -> HumanoidController) & ((className: "SkateboardController", parent: Instance?) -> SkateboardController) & ((className: "VehicleController", parent: Instance?) -> VehicleController) & ((className: "CustomEvent", parent: Instance?) -> CustomEvent) & ((className: "CustomEventReceiver", parent: Instance?) -> CustomEventReceiver) & ((className: "CylinderMesh", parent: Instance?) -> CylinderMesh) & ((className: "FileMesh", parent: Instance?) -> FileMesh) & ((className: "SpecialMesh", parent: Instance?) -> SpecialMesh) & ((className: "DataStoreOptions", parent: Instance?) -> DataStoreOptions) & ((className: "DebuggerWatch", parent: Instance?) -> DebuggerWatch) & ((className: "Dialog", parent: Instance?) -> Dialog) & ((className: "DialogChoice", parent: Instance?) -> DialogChoice) & ((className: "Dragger", parent: Instance?) -> Dragger) & ((className: "Explosion", parent: Instance?) -> Explosion) & ((className: "Decal", parent: Instance?) -> Decal) & ((className: "Texture", parent: Instance?) -> Texture) & ((className: "Hole", parent: Instance?) -> Hole) & ((className: "MotorFeature", parent: Instance?) -> MotorFeature) & ((className: "Fire", parent: Instance?) -> Fire) & ((className: "CSGDictionaryService", parent: Instance?) -> CSGDictionaryService) & ((className: "ForceField", parent: Instance?) -> ForceField) & ((className: "FunctionalTest", parent: Instance?) -> FunctionalTest) & ((className: "GetTextBoundsParams", parent: Instance?) -> GetTextBoundsParams) & ((className: "Frame", parent: Instance?) -> Frame) & ((className: "ImageButton", parent: Instance?) -> ImageButton) & ((className: "TextButton", parent: Instance?) -> TextButton) & ((className: "ImageLabel", parent: Instance?) -> ImageLabel) & ((className: "TextLabel", parent: Instance?) -> TextLabel) & ((className: "TextBox", parent: Instance?) -> TextBox) & ((className: "BillboardGui", parent: Instance?) -> BillboardGui) & ((className: "ScreenGui", parent: Instance?) -> ScreenGui) & ((className: "GuiMain", parent: Instance?) -> GuiMain) & ((className: "AdGui", parent: Instance?) -> AdGui) & ((className: "SurfaceGui", parent: Instance?) -> SurfaceGui) & ((className: "FloorWire", parent: Instance?) -> FloorWire) & ((className: "SelectionBox", parent: Instance?) -> SelectionBox) & ((className: "BoxHandleAdornment", parent: Instance?) -> BoxHandleAdornment) & ((className: "ConeHandleAdornment", parent: Instance?) -> ConeHandleAdornment) & ((className: "CylinderHandleAdornment", parent: Instance?) -> CylinderHandleAdornment) & ((className: "ImageHandleAdornment", parent: Instance?) -> ImageHandleAdornment) & ((className: "LineHandleAdornment", parent: Instance?) -> LineHandleAdornment) & ((className: "SphereHandleAdornment", parent: Instance?) -> SphereHandleAdornment) & ((className: "WireframeHandleAdornment", parent: Instance?) -> WireframeHandleAdornment) & ((className: "ParabolaAdornment", parent: Instance?) -> ParabolaAdornment) & ((className: "SelectionSphere", parent: Instance?) -> SelectionSphere) & ((className: "ArcHandles", parent: Instance?) -> ArcHandles) & ((className: "Handles", parent: Instance?) -> Handles) & ((className: "SurfaceSelection", parent: Instance?) -> SurfaceSelection) & ((className: "SelectionPartLasso", parent: Instance?) -> SelectionPartLasso) & ((className: "SelectionPointLasso", parent: Instance?) -> SelectionPointLasso) & ((className: "Humanoid", parent: Instance?) -> Humanoid) & ((className: "RotateP", parent: Instance?) -> RotateP) & ((className: "RotateV", parent: Instance?) -> RotateV) & ((className: "Glue", parent: Instance?) -> Glue) & ((className: "ManualGlue", parent: Instance?) -> ManualGlue) & ((className: "ManualWeld", parent: Instance?) -> ManualWeld) & ((className: "Motor", parent: Instance?) -> Motor) & ((className: "Motor6D", parent: Instance?) -> Motor6D) & ((className: "Rotate", parent: Instance?) -> Rotate) & ((className: "Snap", parent: Instance?) -> Snap) & ((className: "VelocityMotor", parent: Instance?) -> VelocityMotor) & ((className: "Weld", parent: Instance?) -> Weld) & ((className: "Keyframe", parent: Instance?) -> Keyframe) & ((className: "KeyframeMarker", parent: Instance?) -> KeyframeMarker) & ((className: "PointLight", parent: Instance?) -> PointLight) & ((className: "SpotLight", parent: Instance?) -> SpotLight) & ((className: "SurfaceLight", parent: Instance?) -> SurfaceLight) & ((className: "Script", parent: Instance?) -> Script) & ((className: "LocalScript", parent: Instance?) -> LocalScript) & ((className: "ModuleScript", parent: Instance?) -> ModuleScript) & ((className: "Message", parent: Instance?) -> Message) & ((className: "Hint", parent: Instance?) -> Hint) & ((className: "CornerWedgePart", parent: Instance?) -> CornerWedgePart) & ((className: "Part", parent: Instance?) -> Part) & ((className: "FlagStand", parent: Instance?) -> FlagStand) & ((className: "Seat", parent: Instance?) -> Seat) & ((className: "SkateboardPlatform", parent: Instance?) -> SkateboardPlatform) & ((className: "SpawnLocation", parent: Instance?) -> SpawnLocation) & ((className: "WedgePart", parent: Instance?) -> WedgePart) & ((className: "IntersectOperation", parent: Instance?) -> IntersectOperation) & ((className: "TrussPart", parent: Instance?) -> TrussPart) & ((className: "VehicleSeat", parent: Instance?) -> VehicleSeat) & ((className: "Model", parent: Instance?) -> Model) & ((className: "HopperBin", parent: Instance?) -> HopperBin) & ((className: "Tool", parent: Instance?) -> Tool) & ((className: "Flag", parent: Instance?) -> Flag) & ((className: "Player", parent: Instance?) -> Player) & ((className: "Pose", parent: Instance?) -> Pose) & ((className: "ReflectionMetadata", parent: Instance?) -> ReflectionMetadata) & ((className: "ReflectionMetadataCallbacks", parent: Instance?) -> ReflectionMetadataCallbacks) & ((className: "ReflectionMetadataClasses", parent: Instance?) -> ReflectionMetadataClasses) & ((className: "ReflectionMetadataEnums", parent: Instance?) -> ReflectionMetadataEnums) & ((className: "ReflectionMetadataEvents", parent: Instance?) -> ReflectionMetadataEvents) & ((className: "ReflectionMetadataFunctions", parent: Instance?) -> ReflectionMetadataFunctions) & ((className: "ReflectionMetadataClass", parent: Instance?) -> ReflectionMetadataClass) & ((className: "ReflectionMetadataEnum", parent: Instance?) -> ReflectionMetadataEnum) & ((className: "ReflectionMetadataEnumItem", parent: Instance?) -> ReflectionMetadataEnumItem) & ((className: "ReflectionMetadataMember", parent: Instance?) -> ReflectionMetadataMember) & ((className: "ReflectionMetadataProperties", parent: Instance?) -> ReflectionMetadataProperties) & ((className: "ReflectionMetadataYieldFunctions", parent: Instance?) -> ReflectionMetadataYieldFunctions) & ((className: "RemoteEvent", parent: Instance?) -> RemoteEvent) & ((className: "RemoteFunction", parent: Instance?) -> RemoteFunction) & ((className: "Sky", parent: Instance?) -> Sky) & ((className: "Smoke", parent: Instance?) -> Smoke) & ((className: "Sound", parent: Instance?) -> Sound) & ((className: "Sparkles", parent: Instance?) -> Sparkles) & ((className: "StandalonePluginScripts", parent: Instance?) -> StandalonePluginScripts) & ((className: "StarterGear", parent: Instance?) -> StarterGear) & ((className: "Team", parent: Instance?) -> Team) & ((className: "TeleportOptions", parent: Instance?) -> TeleportOptions) & ((className: "TerrainRegion", parent: Instance?) -> TerrainRegion) & ((className: "TestService", parent: Instance?) -> TestService) & ((className: "BinaryStringValue", parent: Instance?) -> BinaryStringValue) & ((className: "BoolValue", parent: Instance?) -> BoolValue) & ((className: "BrickColorValue", parent: Instance?) -> BrickColorValue) & ((className: "CFrameValue", parent: Instance?) -> CFrameValue) & ((className: "Color3Value", parent: Instance?) -> Color3Value) & ((className: "DoubleConstrainedValue", parent: Instance?) -> DoubleConstrainedValue) & ((className: "IntConstrainedValue", parent: Instance?) -> IntConstrainedValue) & ((className: "IntValue", parent: Instance?) -> IntValue) & ((className: "NumberValue", parent: Instance?) -> NumberValue) & ((className: "ObjectValue", parent: Instance?) -> ObjectValue) & ((className: "RayValue", parent: Instance?) -> RayValue) & ((className: "StringValue", parent: Instance?) -> StringValue) & ((className: "Vector3Value", parent: Instance?) -> Vector3Value) &  ((className: "Wire", parent: Instance?) -> Wire) & ((className: string, parent: Instance?) -> Instance),

	Lock: (instance: Instance, player: Player) -> nil,
	Unlock: (instance: Instance) -> nil,
}

declare Ray: {
	new: ((Origin: Vector3, Direction: Vector3) -> Ray),
}

declare NumberRange: {
	new: ((value: number) -> NumberRange) & ((min: number, max: number) -> NumberRange),
}

declare PathWaypoint: {
	new: ((position: Vector3, action: EnumPathWaypointAction) -> PathWaypoint),
}

declare BrickColor: {
	Red: (() -> BrickColor),
	Yellow: (() -> BrickColor),
	Blue: (() -> BrickColor),
	Gray: (() -> BrickColor),
	DarkGray: (() -> BrickColor),
	White: (() -> BrickColor),
	random: (() -> BrickColor),
	Green: (() -> BrickColor),
	Black: (() -> BrickColor),
	palette: ((paletteValue: number) -> BrickColor),
	new: ((val: number) -> BrickColor) & ((r: number, g: number, b: number) -> BrickColor) & ((color: Color3) -> BrickColor) & ((name: "Alder" | "Artichoke" | "Baby blue" | "Beige" | "Black" | "Black metallic" | "Br. reddish orange" | "Br. yellowish green" | "Br. yellowish orange" | "Brick yellow" | "Bright blue" | "Bright bluish green" | "Bright bluish violet" | "Bright green" | "Bright orange" | "Bright purple" | "Bright red" | "Bright reddish lilac" | "Bright reddish violet" | "Bright violet" | "Bright yellow" | "Bronze" | "Brown" | "Burgundy" | "Burlap" | "Burnt Sienna" | "Buttermilk" | "CGA brown" | "Cadet blue" | "Camo" | "Carnation pink" | "Cashmere" | "Cloudy grey" | "Cocoa" | "Cool yellow" | "Copper" | "Cork" | "Crimson" | "Curry" | "Cyan" | "Daisy orange" | "Dark Curry" | "Dark Royal blue" | "Dark blue" | "Dark green" | "Dark grey" | "Dark grey metallic" | "Dark indigo" | "Dark nougat" | "Dark orange" | "Dark red" | "Dark stone grey" | "Dark taupe" | "Deep blue" | "Deep orange" | "Dirt brown" | "Dove blue" | "Dusty Rose" | "Earth blue" | "Earth green" | "Earth orange" | "Earth yellow" | "Eggplant" | "Electric blue" | "Faded green" | "Fawn brown" | "Fire Yellow" | "Flame reddish orange" | "Flame yellowish orange" | "Flint" | "Fog" | "Forest green" | "Fossil" | "Ghost grey" | "Gold" | "Grey" | "Grime" | "Gun metallic" | "Hot pink" | "Hurricane grey" | "Institutional white" | "Khaki" | "Lapis" | "Laurel green" | "Lavender" | "Lemon metalic" | "Lig. Yellowich orange" | "Lig. yellowish green" | "Light Royal blue" | "Light blue" | "Light bluish green" | "Light bluish violet" | "Light brick yellow" | "Light green (Mint)" | "Light grey" | "Light grey metallic" | "Light lilac" | "Light orange" | "Light orange brown" | "Light pink" | "Light purple" | "Light red" | "Light reddish violet" | "Light stone grey" | "Light yellow" | "Lilac" | "Lily white" | "Lime green" | "Linen" | "Magenta" | "Maroon" | "Mauve" | "Med. bluish green" | "Med. reddish violet" | "Med. yellowish green" | "Med. yellowish orange" | "Medium Royal blue" | "Medium blue" | "Medium bluish violet" | "Medium green" | "Medium lilac" | "Medium orange" | "Medium red" | "Medium stone grey" | "Mid gray" | "Mint" | "Moss" | "Mulberry" | "Navy blue" | "Neon green" | "Neon orange" | "New Yeller" | "Nougat" | "Olive" | "Olivine" | "Oyster" | "Parsley green" | "Pastel Blue" | "Pastel blue-green" | "Pastel brown" | "Pastel green" | "Pastel light blue" | "Pastel orange" | "Pastel violet" | "Pastel yellow" | "Pearl" | "Persimmon" | "Phosph. White" | "Pine Cone" | "Pink" | "Plum" | "Quill grey" | "Really black" | "Really blue" | "Really red" | "Red flip/flop" | "Reddish brown" | "Reddish lilac" | "Royal blue" | "Royal purple" | "Rust" | "Sage green" | "Salmon" | "Sand blue" | "Sand blue metallic" | "Sand green" | "Sand red" | "Sand violet" | "Sand violet metallic" | "Sand yellow" | "Sand yellow metallic" | "Sea green" | "Seashell" | "Shamrock" | "Silver" | "Silver flip/flop" | "Slime green" | "Smoky grey" | "Steel blue" | "Storm blue" | "Sunrise" | "Tawny" | "Teal" | "Terra Cotta" | "Toothpaste" | "Tr. Blue" | "Tr. Bright bluish violet" | "Tr. Brown" | "Tr. Flu. Blue" | "Tr. Flu. Green" | "Tr. Flu. Red" | "Tr. Flu. Reddish orange" | "Tr. Flu. Yellow" | "Tr. Green" | "Tr. Lg blue" | "Tr. Medi. reddish violet" | "Tr. Red" | "Tr. Yellow" | "Transparent" | "Turquoise" | "Warm yellowish orange" | "Wheat" | "White" | "Yellow flip/flop") -> BrickColor),
}

declare Vector2: {
	zero: Vector2,
	one: Vector2,
	xAxis: Vector2,
	yAxis: Vector2,
	new: ((x: number?, y: number?) -> Vector2),
}

declare Vector2int16: {
	new: ((x: number, y: number) -> Vector2int16),
}

declare Color3: {
	fromRGB: ((red: number?, green: number?, blue: number?) -> Color3),
	fromHSV: ((hue: number, saturation: number, value: number) -> Color3),
	toHSV: ((color: Color3) -> (number, number, number)),
	new: ((red: number?, green: number?, blue: number?) -> Color3),
	fromHex: ((hex: string) -> Color3),
}

declare UDim: {
	new: ((Scale: number?, Offset: number?) -> UDim),
}

declare PhysicalProperties: {
	new: ((material: EnumMaterial) -> PhysicalProperties) & ((density: number, friction: number, elasticy: number, frictionWeight: number?, elasticyWeight: number?) -> PhysicalProperties),
}

declare Axes: {
	new: ((axes: any) -> Axes),
}

declare Region3: {
	new: ((min: Vector3, max: Vector3) -> Region3),
}

declare Region3int16: {
	new: ((min: Vector3int16, max: Vector3int16) -> Region3int16),
}

declare UDim2: {
	fromScale: ((xScale: number, yScale: number) -> UDim2),
	fromOffset: ((xOffset: number, yOffset: number) -> UDim2),
	new: ((x: UDim, y: UDim) -> UDim2) & ((xScale: number?, xOffset: number?, yScale: number?, yOffset: number?) -> UDim2),
}

declare CFrame: {
	identity: CFrame,
	fromEulerAnglesYXZ: ((rx: number, ry: number, rz: number) -> CFrame),
	Angles: ((rx: number, ry: number, rz: number) -> CFrame),
	fromMatrix: ((pos: Vector3, vX: Vector3, vY: Vector3, vZ: Vector3?) -> CFrame),
	fromAxisAngle: ((v: Vector3, r: number) -> CFrame),
	fromOrientation: ((rx: number, ry: number, rz: number) -> CFrame),
	fromEulerAnglesXYZ: ((rx: number, ry: number, rz: number) -> CFrame),
	lookAt: ((at: Vector3, target: Vector3, up: Vector3?) -> CFrame),
	new: (() -> CFrame) & ((pos: Vector3) -> CFrame) & ((pos: Vector3, lookAt: Vector3) -> CFrame) & ((x: number, y: number, z: number) -> CFrame) & ((x: number, y: number, z: number, qX: number, qY: number, qZ: number, qW: number) -> CFrame) & ((x: number, y: number, z: number, R00: number, R01: number, R02: number, R10: number, R11: number, R12: number, R20: number, R21: number, R22: number) -> CFrame),
}

declare Faces: {
	new: ((normalIds: any) -> Faces),
}

declare Rect: {
	new: ((min: Vector2, max: Vector2) -> Rect) & ((minX: number, minY: number, maxX: number, maxY: number) -> Rect),
}

declare Vector3: {
	zero: Vector3,
	one: Vector3,
	xAxis: Vector3,
	yAxis: Vector3,
	zAxis: Vector3,
	fromNormalId: ((normal: EnumNormalId) -> Vector3),
	fromAxis: ((axis: EnumAxis) -> Vector3),
	FromNormalId: ((normal: EnumNormalId) -> Vector3),
	FromAxis: ((axis: EnumAxis) -> Vector3),
	new: ((x: number?, y: number?, z: number?) -> Vector3),
}

declare Vector3int16: {
	new: ((x: number?, y: number?, z: number?) -> Vector3int16),
}

declare Random: {
	new: ((seed: number?) -> Random),
}

declare DateTime: {
	now: (() -> DateTime),
	fromUnixTimestamp: ((unixTimestamp: number) -> DateTime),
	fromUnixTimestampMillis: ((unixTimestampMillis: number) -> DateTime),
	fromUniversalTime: ((year: number?, month: number?, day: number?, hour: number?, minute: number?, second: number?, millisecond: number?) -> DateTime),
	fromLocalTime: ((year: number?, month: number?, day: number?, hour: number?, minute: number?, second: number?, millisecond: number?) -> DateTime),
	fromIsoDate: ((isoDate: string) -> DateTime),
}

declare NumberSequence: {
	new: ((n: number) -> NumberSequence) & ((n0: number, n1: number) -> NumberSequence) & ((keypoints: { NumberSequenceKeypoint }) -> NumberSequence),
}

declare ColorSequence: {
	new: ((c: Color3) -> ColorSequence) & ((c0: Color3, c1: Color3) -> ColorSequence) & ((keypoints: { ColorSequenceKeypoint }) -> ColorSequence),
}

declare NumberSequenceKeypoint: {
	new: ((time: number, value: number, envelop: number?) -> NumberSequenceKeypoint),
}

declare ColorSequenceKeypoint: {
	new: ((time: number, color: Color3) -> ColorSequenceKeypoint),
}

declare RaycastParams: {
	new: (() -> RaycastParams),
}

declare OverlapParams: {
	new: (() -> OverlapParams),
}

declare CatalogSearchParams: {
	new: (() -> CatalogSearchParams),
}

declare Font: {
	new: ((family: string, weight: EnumFontWeight?, style: EnumFontStyle?) -> Font),
	fromEnum: ((font: EnumFont) -> Font),
	fromName: ((name: string, weight: EnumFontWeight?, style: EnumFontStyle?) -> Font),
	fromId: ((id: number, weight: EnumFontWeight?, style: EnumFontStyle?) -> Font),
}


declare class GlobalSettings extends GenericSettings
    Lua: LuaSettings
    Game: GameSettings
    Studio: Studio
    Network: NetworkSettings
    Physics: PhysicsSettings
    Rendering: RenderSettings
    Diagnostics: DebugSettings
	["Task Scheduler"]: any
	["Game Options"]: any
    function GetFFlag(self, name: string): boolean
    function GetFVariable(self, name: string): string
end

declare SharedTable: {
    new: () -> SharedTable,
    new: (t: { [any]: any }) -> SharedTable,
    clear: (st: SharedTable) -> (),
    clone: (st: SharedTable, deep: boolean?) -> SharedTable,
    cloneAndFreeze: (st: SharedTable, deep: boolean?) -> SharedTable,
    increment: (st: SharedTable, key: string | number, delta: number) -> number,
    isFrozen: (st: SharedTable) -> boolean,
    size: (st: SharedTable) -> number,
    update: (st: SharedTable, key: string | number, f: (any) -> any) -> (),
}

declare _PLACE_ID: number
declare _IS_STUDIO_JOIN: string
declare _SERVER_ADDRESS: any
declare _SERVER_PORT: string
declare _CREATOR_ID: number
declare _USER_ID: number
declare _USER_NAME: any
declare _MEMBERSHIP_TYPE: any
declare _CHAR_APPEARANCE: string
declare _PING_URL: string

declare _BASE_URL: string
declare _THUMBNAIL_KEY: string
declare _RENDER_TYPE: string
declare _ASSET_ID: number

declare _MAP_LOCATION_EXISTS: boolean
declare _MAP_LOCATION: any
declare _SERVER_PORT: number
declare _SERVER_PRESENCE_URL: string

declare _SERVER: boolean
declare _CLIENT: boolean

declare game: DataModel
declare Game: DataModel
declare workspace: Workspace
declare Workspace: Workspace
declare TeleportService: TeleportService
declare plugin: Plugin
declare script: LuaSourceContainer
declare function loadfile(file: string): any
declare function dofile(file: string): any

-- fusion

-- pubtypes

--[[
	Stores common public-facing type information for Fusion APIs.
]]

type Set<T> = { [T]: any }

--[[
	General use types
]]

-- A unique symbolic value.
type Symbol = {
	type: "Symbol",
	name: string,
}

-- Types that can be expressed as vectors of numbers, and so can be animated.
type Animatable =
	number
	| CFrame
	| Color3
	| ColorSequenceKeypoint
	| DateTime
	| NumberRange
	| NumberSequenceKeypoint
	| PhysicalProperties
	| Ray
	| Rect
	| Region3
	| Region3int16
	| UDim
	| UDim2
	| Vector2
	| Vector2int16
	| Vector3
	| Vector3int16

-- A task which can be accepted for cleanup.
type Task =
	Instance
	| RBXScriptConnection
	| () -> () | { destroy: (any) -> () } | { Destroy: (any) -> () } | { Task }

-- Script-readable version information.
type Version = {
	major: number,
	minor: number,
	isRelease: boolean,
}

-- An object which stores a value scoped in time.
type Contextual<T> = {
	type: "Contextual",
	now: (Contextual<T>) -> T,
	is: (Contextual<T>, T) -> ContextualIsMethods,
}

type ContextualIsMethods = {
	during: <T, A...>(ContextualIsMethods, (A...) -> T, A...) -> T,
}

--[[
	Generic reactive graph types
]]

-- A graph object which can have dependents.
type Dependency = {
	dependentSet: Set<Dependent>,
}

-- A graph object which can have dependencies.
type Dependent = {
	update: (Dependent) -> boolean,
	dependencySet: Set<Dependency>,
}

-- An object which stores a piece of reactive state.
type StateObject<T> = Dependency & {
	type: "State",
	kind: string,
	_typeIdentifier: T,
}

-- Either a constant value of type T, or a state object containing type T.
type CanBeState<T> = StateObject<T> | T

-- Function signature for use callbacks.
type Use = <T>(target: CanBeState<T>) -> T

--[[
	Specific reactive graph types
]]

-- A state object whose value can be set at any time by the user.
type Value<T> = StateObject<T> & {
	kind: "State",
	set: (Value<T>, newValue: any, force: boolean?) -> (),
}

-- A state object whose value is derived from other objects using a callback.
type Computed<T> = StateObject<T> & Dependent & {
	kind: "Computed",
}

-- A state object whose value is derived from other objects using a callback.
type ForPairs<KO, VO> = StateObject<{ [KO]: VO }> & Dependent & {
	kind: "ForPairs",
}
-- A state object whose value is derived from other objects using a callback.
type ForKeys<KO, V> = StateObject<{ [KO]: V }> & Dependent & {
	kind: "ForKeys",
}
-- A state object whose value is derived from other objects using a callback.
type ForValues<K, VO> = StateObject<{ [K]: VO }> & Dependent & {
	kind: "ForKeys",
}

-- A state object which follows another state object using tweens.
type Tween<T> = StateObject<T> & Dependent & {
	kind: "Tween",
}

-- A state object which follows another state object using spring simulation.
type Spring<T> = StateObject<T> & Dependent & {
	kind: "Spring",
	setPosition: (Spring<T>, newPosition: Animatable) -> (),
	setVelocity: (Spring<T>, newVelocity: Animatable) -> (),
	addVelocity: (Spring<T>, deltaVelocity: Animatable) -> (),
}

-- An object which can listen for updates on another state object.
type Observer = Dependent & {
	kind: "Observer",
	onChange: (Observer, callback: () -> ()) -> (() -> ()),
}

--[[
	Instance related types
]]

-- Denotes children instances in an instance or component's property table.
type SpecialKey = {
	type: "SpecialKey",
	kind: string,
	stage: "self" | "descendants" | "ancestor" | "observer",
	apply: (
		SpecialKey,
		value: any,
		applyTo: Instance,
		cleanupTasks: { Task }
	) -> (),
}

-- A collection of instances that may be parented to another instance.
type Children = Instance | StateObject<Children> | { [any]: Children }

-- A table that defines an instance's properties, handlers and children.
type PropertyTable = { [string | SpecialKey]: any }

-- init

export type Fusion = {
	version: Version,

	New: (
		className: string
	) -> ((propertyTable: PropertyTable) -> Instance),
	Hydrate: (
		target: Instance
	) -> ((propertyTable: PropertyTable) -> Instance),
	Ref: SpecialKey,
	Cleanup: SpecialKey,
	Children: SpecialKey,
	Out: (propertyName: string) -> SpecialKey,
	OnEvent: (eventName: string) -> SpecialKey,
	OnChange: (propertyName: string) -> SpecialKey,

	Value: <T>(initialValue: T) -> Value<T>,
	Computed: <T>(callback: (Use) -> T, destructor: (T) -> ()?) -> Computed<T>,
	ForPairs: <KI, VI, KO, VO, M>(
		inputTable: CanBeState<{ [KI]: VI }>,
		processor: (Use, KI, VI) -> (KO, VO, M?),
		destructor: (KO, VO, M?) -> ()?
	) -> ForPairs<KO, VO>,
	ForKeys: <KI, KO, M>(
		inputTable: CanBeState<{ [KI]: any }>,
		processor: (Use, KI) -> (KO, M?),
		destructor: (KO, M?) -> ()?
	) -> ForKeys<KO, any>,
	ForValues: <VI, VO, M>(
		inputTable: CanBeState<{ [any]: VI }>,
		processor: (Use, VI) -> (VO, M?),
		destructor: (VO, M?) -> ()?
	) -> ForValues<any, VO>,
	Observer: (watchedState: StateObject<any>) -> Observer,

	Tween: <T>(goalState: StateObject<T>, tweenInfo: TweenInfo?) -> Tween<T>,
	Spring: <T>(
		goalState: StateObject<T>,
		speed: CanBeState<number>?,
		damping: CanBeState<number>?
	) -> Spring<T>,

	Contextual: <T>(defaultValue: T) -> Contextual<T>,
	cleanup: (...any) -> (),
	doNothing: (...any) -> (),
	peek: Use,
}

export type Server = {
	new: (Name: string) -> Server,
	Server: (Name: string) -> Server,
	Fire: (self: Server, Player: Player, EventName: string, ...any) -> (),
	FireAll: (self: Server, EventName: string, ...any) -> (),
	FireAllExcept: (self: Server, Player: Player, EventName: string, ...any) -> (),
	FireList: (self: Server, Players: {Player}, EventName: string, ...any) -> (),
	FireWithFilter: (self: Server, Filter: (Player) -> boolean, EventName: string, ...any) -> (),
	On: (self: Server, EventName: string, Callback: ((Player, ...any) -> ...any?)) -> (),
	Folder: (self: Server, Player: Player?) -> Model,
}

export type Client = {
	new: (self: Client, Name: string) -> Client,
	Client: (self: Client, Name: string) -> Client,
	Fire: (self: Client, EventName: string, ...any) -> Promise,
	Call: (self: Client, EventName: string, ...any) -> Promise,
	On: (self: Client, EventName: string, Callback: ((...any) -> ())?) -> Promise,
	Folder: (self: Client) -> Model,
	LocalFolder: (self: Client) -> Model,
}

export type Promise = {
	new: (Callback: (Resolve: (...any) -> (), Reject: (...any) -> ()) -> ()) -> Promise,
	Promise: (Callback: (Resolve: (...any) -> (), Reject: (...any) -> ()) -> ()) -> Promise,
	Reject: (a: any, b: any, c: any, d: any, e: any) -> Promise,
	_Resolve: (self: Promise, ...any) -> (),
	_Reject: (self: Promise, ...any) -> (),
	Then: (self: Promise, OnResolve: ((...any) -> ...any)?, OnReject: ((...any) -> ...any)?) -> Promise,
	Catch: (self: Promise, OnReject: ((...any) -> ())) -> ...any,
	Finally: (self: Promise, Finally: (() -> ())) -> ...any,
	Await: (self: Promise) -> ...any,
}

type SignalNode<T...> = {
	Next: SignalNode<T...>?,
	Callback: (T...) -> (),
}

export type Signal<T...> = {
	Root: SignalNode<T...>?,

	Connect: (self: Signal<T...>, Callback: (T...) -> ()) -> () -> (),
	Wait: (self: Signal<T...>) -> (Callback: (Resolve: (...any) -> (), Reject: (...any) -> ()) -> ()) -> Promise,
	Fire: (self: Signal<T...>, T...) -> (),
	DisconnectAll: (self: Signal<T...>) -> (),
}

export type Clock = {
	new: (Interval: number, Callback: () -> ()) -> Clock,
	Clock: (Interval: number, Callback: () -> ()) -> Clock,
	Pause: (self: Clock) -> (),
	Resume: (self: Clock) -> (),
	Advance: (self: Clock, Delta: number) -> (),
}

type RedCore = {
	Server: (Name: string, Definitions: {string}?) -> Server,
	Client: (Name: string) -> Client,

	Collection: <T...>(Tag: string, Start: (Instance) -> (T...), Stop: (T...) -> ()) -> () -> (),
	Ratelimit: <T>(Limit: number, Interval: number) -> (Key: T?) -> boolean,
	Promise: Promise,
	Signal: {
		new: <T...>() -> Signal<T...>,
		Connect: <T...>(self: Signal<T...>, Callback: (T...) -> ()) -> () -> (),
		Wait: <T...>(self: Signal<T...>) -> Promise,
		Fire: <T...>(self: Signal<T...>, T...) -> (),
		DisconnectAll: <T...>(self: Signal<T...>) -> (),
	},
	Clock: Clock,
	Spawn: <T...>(fn: (T...) -> (), T...) -> (), -- variadics SUCK
	Bin: () -> ((Item: (() -> ...any) | Instance | RBXScriptConnection) -> (), () -> ())
}

export type Red = {
	Help: () -> string,
	Load: (self: Red, Script: LuaSourceContainer) -> RedCore,
}

-- just plain useful

export type InstanceName =
	"Accoutrement"
	| "Hat"
	| "AdvancedDragger"
	| "Animation"
	| "CurveAnimation"
	| "KeyframeSequence"
	| "AnimationController"
	| "Animator"
	| "AudioDistortion"
	| "AudioFader"
	| "AudioFlanger"
	| "AudioListener"
	| "AudioPitchShifter"
	| "AudioPlayer"
	| "AudioReverb"
	| "AudioSearchParams"
	| "Backpack"
	| "BindableEvent"
	| "BindableFunction"
	| "BodyAngularVelocity"
	| "BodyForce"
	| "BodyGyro"
	| "BodyPosition"
	| "BodyThrust"
	| "BodyVelocity"
	| "RocketPropulsion"
	| "BubbleChatMessageProperties"
	| "Camera"
	| "BodyColors"
	| "CharacterMesh"
	| "Pants"
	| "Shirt"
	| "ShirtGraphic"
	| "Skin"
	| "ClickDetector"
	| "DragDetector"
	| "Configuration"
	| "AnimationConstraint"
	| "BallSocketConstraint"
	| "LineForce"
	| "LinearVelocity"
	| "Torque"
	| "HumanoidController"
	| "SkateboardController"
	| "VehicleController"
	| "CustomEvent"
	| "CustomEventReceiver"
	| "CylinderMesh"
	| "FileMesh"
	| "SpecialMesh"
	| "DataStoreOptions"
	| "DebuggerWatch"
	| "Dialog"
	| "DialogChoice"
	| "Dragger"
	| "Explosion"
	| "Decal"
	| "Texture"
	| "Hole"
	| "MotorFeature"
	| "Fire"
	| "CSGDictionaryService"
	| "ForceField"
	| "FunctionalTest"
	| "GetTextBoundsParams"
	| "Frame"
	| "ImageButton"
	| "TextButton"
	| "ImageLabel"
	| "TextLabel"
	| "TextBox"
	| "BillboardGui"
	| "ScreenGui"
	| "GuiMain"
	| "AdGui"
	| "SurfaceGui"
	| "FloorWire"
	| "SelectionBox"
	| "BoxHandleAdornment"
	| "ConeHandleAdornment"
	| "CylinderHandleAdornment"
	| "ImageHandleAdornment"
	| "LineHandleAdornment"
	| "SphereHandleAdornment"
	| "WireframeHandleAdornment"
	| "ParabolaAdornment"
	| "SelectionSphere"
	| "ArcHandles"
	| "Handles"
	| "SurfaceSelection"
	| "SelectionPartLasso"
	| "SelectionPointLasso"
	| "Humanoid"
	| "RotateP"
	| "RotateV"
	| "Glue"
	| "ManualGlue"
	| "ManualWeld"
	| "Motor"
	| "Motor6D"
	| "Rotate"
	| "Snap"
	| "VelocityMotor"
	| "Weld"
	| "Keyframe"
	| "KeyframeMarker"
	| "PointLight"
	| "SpotLight"
	| "SurfaceLight"
	| "Script"
	| "LocalScript"
	| "ModuleScript"
	| "Message"
	| "Hint"
	| "CornerWedgePart"
	| "Part"
	| "FlagStand"
	| "Seat"
	| "SkateboardPlatform"
	| "SpawnLocation"
	| "WedgePart"
	| "TrussPart"
	| "VehicleSeat"
	| "Model"
	| "HopperBin"
	| "Tool"
	| "Flag"
	| "Player"
	| "Pose"
	| "ReflectionMetadata"
	| "ReflectionMetadataCallbacks"
	| "ReflectionMetadataClasses"
	| "ReflectionMetadataEnums"
	| "ReflectionMetadataEvents"
	| "ReflectionMetadataFunctions"
	| "ReflectionMetadataClass"
	| "ReflectionMetadataEnum"
	| "ReflectionMetadataEnumItem"
	| "ReflectionMetadataMember"
	| "ReflectionMetadataProperties"
	| "ReflectionMetadataYieldFunctions"
	| "RemoteEvent"
	| "RemoteFunction"
	| "Sky"
	| "Smoke"
	| "Sound"
	| "Sparkles"
	| "StandalonePluginScripts"
	| "StarterGear"
	| "Team"
	| "TeleportOptions"
	| "TerrainRegion"
	| "TestService"
	| "BinaryStringValue"
	| "BoolValue"
	| "BrickColorValue"
	| "CFrameValue"
	| "Color3Value"
	| "DoubleConstrainedValue"
	| "IntConstrainedValue"
	| "IntValue"
	| "NumberValue"
	| "ObjectValue"
	| "RayValue"
	| "StringValue"
	| "Vector3Value"
	| "Wire"

declare LoadLibrary: ((libraryName: "RbxFusion") -> Fusion) & ((libraryName: "RbxRed") -> Red) & ((libraryName: string) -> any)

declare function settings(): GlobalSettings
declare function UserSettings(): UserSettings
declare function PluginManager(): PluginManager
declare function ypcall(f: (() -> any) | (() -> ()) | ((...any) -> (), (...any) -> ()) -> (), ...: any): (boolean, any)
