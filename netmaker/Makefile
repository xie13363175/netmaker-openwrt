#
# Copyright (C) 2019 sbilly <superli_1980@hotmail.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=netclient
PKG_VERSION:=0.18.5
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gravitl/netclient.git
PKG_SOURCE_VERSION:=a37f1d6726c56e1bac919c1a2fc7b8c0a4c05fd1
PKG_SOURCE_DATE:=20230331
PKG_MIRROR_HASH:=skip

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=sbilly <superli_1980@hotmail.com>

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/gravitl/netclient
GO_PKG_INSTALL_EXTRA:=extra/file extra/dir
GO_PKG_EXCLUDES:=excluded
GO_PKG_LDFLAGS:=-s -w

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/netclient
$(call Package/netclient/Default)
$(call GoPackage/GoSubMenu)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
endef

define Package/netclient/Default
  TITLE:=netclient for OpenWRT
  URL:=https://github.com/gravitl/netclient
  DEPENDS:=$(GO_ARCH_DEPENDS)
  MAINTAINER:=sbilly <superli_1980@hotmail.com>
endef

define Package/netclient/Default/description
netclient is a platform for creating and managing fast, secure, and 
dynamic virtual overlay networks using WireGuard. This project offers
OpenWRT packages for netclient.
endef

define Package/netclient/description
$(call Package/netclient/Default/description)

This package contains the binaries.
endef

define Package/netclient-dev
  TITLE+= (source files)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  PKGARCH:=all
endef

define Package/netclient-dev/description
$(call Package/netclient/Default/description)

This package provides the source files.
endef

define Package/netclient/install
	$(INSTALL_DIR) $(1)/etc/netclient
	$(INSTALL_DIR) $(1)/etc/netclient/config
	$(INSTALL_DIR) $(1)/etc/systemd/
	$(INSTALL_DIR) $(1)/etc/systemd/system
	$(INSTALL_DIR) $(1)/usr/bin
	#$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/netmaker $(1)/usr/bin/
	$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/netclient $(1)/usr/bin/
	$(CP) ./root/* $(1)/
	$(LN) netclient $(1)/etc/netclient/netclient
endef

define Package/netclient/postinst
#!/bin/sh
	chmod +x ./etc/hotplug.d/iface/99-netclient
	chmod +x ./etc/netclient
exit 0
endef

$(eval $(call GoBinPackage,netclient))
$(eval $(call BuildPackage,netclient))

$(eval $(call GoSrcPackage,netclient-dev))
$(eval $(call BuildPackage,netclient-dev))
