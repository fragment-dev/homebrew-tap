require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5660.0.0-darwin-x64.tar.gz"
    sha256 "880b53e2e419a5b92791d55da760ab7f57af5dc04f3ebd6e03c3323cfc48de68"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5660.0.0-darwin-arm64.tar.gz"
      sha256 "33ac996365068d796c68b95654373081817f0a8bcbe11efb174cfadea603b2d2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5660.0.0-linux-x64.tar.gz"
    sha256 "8865a2f70b37a9f524f3f762206b1b5fefa1bdc6195c51bc1d6fb3f3412845f8"
  end
  version "5660.0.0"
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
