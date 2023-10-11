require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3802.0.0-darwin-x64.tar.gz"
    sha256 "f9b0bab20f81fd1068dcbdab6138f19784647fa3fa997f33544a13e9bf69a424"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3802.0.0-darwin-arm64.tar.gz"
      sha256 "773b2a7b3115beb689cf3cbd71debc555e4fea6b380213fb77388a01cb45591f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3802.0.0-linux-x64.tar.gz"
    sha256 "c74ab51b9f784c2e50346b4a32f8d8be369fc4de3d1493cb4570ac227fb67a63"
  end
  version "3802.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
