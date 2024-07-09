require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5371.0.0-darwin-x64.tar.gz"
    sha256 "b5e1a77a9dc493d72fcfc269dfc0c5cff9338ea3b3b1025ec3d287f14ca26036"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5371.0.0-darwin-arm64.tar.gz"
      sha256 "e7b33ba4d74f14f36ac6ad80ef6343f20835e00706f0174ff13f491e58971b8e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5371.0.0-linux-x64.tar.gz"
    sha256 "6859a1777f5a5361dc7ddf2a46877b30162b499a98839426cd3c06e6ddbe19cc"
  end
  version "5371.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
