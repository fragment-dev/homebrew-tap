require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3896.0.0-darwin-x64.tar.gz"
    sha256 "043420f17c6f6389a55904db8f8a623dcc3dfd1032e2443a607c89329f056753"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3896.0.0-darwin-arm64.tar.gz"
      sha256 "55c82d5cf2fe016b2fce17c2dd2840c177a1069c7ae21a16d99f032d95d96fe4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3896.0.0-linux-x64.tar.gz"
    sha256 "3e0398f6261abd4405853794522b3a3fb551d0289cf516074295fcdb231d48aa"
  end
  version "3896.0.0"
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
