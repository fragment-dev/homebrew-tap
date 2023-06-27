require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2941.0.0-darwin-x64.tar.gz"
    sha256 "697998af465ad2cccfa444af8161c419ea813fe02c92fa28172e0499b4d87032"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2941.0.0-darwin-arm64.tar.gz"
      sha256 "c8d8c55eed500ec4838ec738ffb2a93d3d201b8a032afae1e382985cedf46745"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2941.0.0-linux-x64.tar.gz"
    sha256 "96e595a86fda6983d8e657137e19b6f18a1cb798d43971ecc256ee20f760e549"
  end
  version "2941.0.0"
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
