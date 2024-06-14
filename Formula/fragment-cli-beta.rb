require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5280.0.0-darwin-x64.tar.gz"
    sha256 "6030c36131e192256b3c2611d632ff344f7c0ae4a3d2d40efd4fcb8a404ef1c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5280.0.0-darwin-arm64.tar.gz"
      sha256 "7c5fcd752e4c115b11a916f95c9f648489257290f5f3dca5682ffed321da018c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5280.0.0-linux-x64.tar.gz"
    sha256 "7f32465bb977ebcc7fe33ba63775e470501e693ce448e5e1955c98f2ef9a32a0"
  end
  version "5280.0.0"
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
