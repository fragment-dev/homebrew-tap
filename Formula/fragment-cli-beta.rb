require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2329.0.0-darwin-x64.tar.gz"
    sha256 "807a69d815945c40e2d368f50f324c55de053a87d160679b05a64c768e61e21a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2329.0.0-darwin-arm64.tar.gz"
      sha256 "595e16bc1d952205a54a9db2df0fc8b340ac72be72c328a684b7ad1fef31f0f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2329.0.0-linux-x64.tar.gz"
    sha256 "8f1f40f916ba31ad52e94f23b258b1aee1ac5baf765aa8ba92121988c7323065"
  end
  version "2329.0.0"
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
