require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4596.0.0-darwin-x64.tar.gz"
    sha256 "4149c36852ecd29730ed9c28457d089107e167706375f840d50efbe035ee33a8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4596.0.0-darwin-arm64.tar.gz"
      sha256 "ac042d878dbc58ff4a0fe03e98d206f438eae5f535774f1803902150b367c311"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4596.0.0-linux-x64.tar.gz"
    sha256 "44f27f696aa72ef9024a0c091cb9b4a114b817e54c3d252528e5993b39c3b99c"
  end
  version "4596.0.0"
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
