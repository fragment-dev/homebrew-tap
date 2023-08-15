require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3329.0.0-darwin-x64.tar.gz"
    sha256 "1ceb7e3641517f80ac9163108c37abb6b148bd64ae82087776922d8f9fb9865d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3329.0.0-darwin-arm64.tar.gz"
      sha256 "ad25f85c603c2dcdf185c9313d98ddb1d0f68cdd7ab18dea86baf285ca51c8da"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3329.0.0-linux-x64.tar.gz"
    sha256 "95f238e311d635fac889035284d3951d0ecef9230a63abb78dc7583ee2166543"
  end
  version "3329.0.0"
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
