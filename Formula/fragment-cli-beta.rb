require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2899.0.0-darwin-x64.tar.gz"
    sha256 "14878da2867306057861b899607f15431b91fcc08fd2f5345f41b174546bdc66"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2899.0.0-darwin-arm64.tar.gz"
      sha256 "8090bc855101661d6d9da6a6bbe093f0772e4285414eb56ae7233be872ee2da4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2899.0.0-linux-x64.tar.gz"
    sha256 "c3e9e317ae60e35bdce13fd8d76dd36341c36abef155959d5d2f49a1f8db1dc6"
  end
  version "2899.0.0"
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
