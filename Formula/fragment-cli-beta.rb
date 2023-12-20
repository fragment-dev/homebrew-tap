require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4184.0.0-darwin-x64.tar.gz"
    sha256 "a480604e39f573126b04f61e5f23ff3ca535a954acfa61257f50399c8a73a4b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4184.0.0-darwin-arm64.tar.gz"
      sha256 "15aaadba3a67af4e656875e51f291e247b3369aa4415f6c91e7fec9d5c434df2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4184.0.0-linux-x64.tar.gz"
    sha256 "18f22dc2cb4534d9902d54a08c98a32d33f42657b6ec5db8a4ac14a76da3e2c5"
  end
  version "4184.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
