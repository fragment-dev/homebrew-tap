require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3864.0.0-darwin-x64.tar.gz"
    sha256 "05b7ecf857ebac89455dfc9f46d2220060c3a322a39d2d44136598298f11f470"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3864.0.0-darwin-arm64.tar.gz"
      sha256 "884b581e0312006c2ca2ad97d489e160d55c4f787151622375227ae714ada24f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3864.0.0-linux-x64.tar.gz"
    sha256 "0dd9fbc1f4a2539e23b8fa770e1d77a0044d0b4aa77ae3c681548bf8949e8b1d"
  end
  version "3864.0.0"
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
