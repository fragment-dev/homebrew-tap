require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5062.0.0-darwin-x64.tar.gz"
    sha256 "85bc3f4e9fbd8f46ccbee5c64ac13e09fbcf0469bc5a5986c650deef503699d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5062.0.0-darwin-arm64.tar.gz"
      sha256 "66046a3b2553058e74e07e93f1980d59a187a3d461e56039bfcbfe4e6f51d350"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5062.0.0-linux-x64.tar.gz"
    sha256 "e178a885ed9defda5a00e4c0333ebe44394198ad1ad135b76a2d275cc6c1c50c"
  end
  version "5062.0.0"
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
