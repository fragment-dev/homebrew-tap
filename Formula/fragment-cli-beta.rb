require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2359.0.0-darwin-x64.tar.gz"
    sha256 "8914b92d3b4ea4f66b5d0d75f3650693745e2e76b468b429c0cc1cc67218cf3e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2359.0.0-darwin-arm64.tar.gz"
      sha256 "389661aa6c6c7babc7d8208e5351378d7f25165364214cf42dbbce3ba1c905e7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2359.0.0-linux-x64.tar.gz"
    sha256 "f186d6245168acec3510d261bafcf0d4751ce1fbb4b9c190ed0fa07f1fc5489a"
  end
  version "2359.0.0"
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
