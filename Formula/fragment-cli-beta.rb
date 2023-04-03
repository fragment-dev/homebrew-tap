require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2336.0.0-darwin-x64.tar.gz"
    sha256 "10e43c3a57b293810c1c4a80d257d0bddbaff134dbdc4c060be7d7bd3cc8cd62"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2336.0.0-darwin-arm64.tar.gz"
      sha256 "bec0d53c6f2a5c335a7b79a51ecee42245c517163588671725882c54790a6051"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2336.0.0-linux-x64.tar.gz"
    sha256 "5613228504900269183ed237884a7a9cfe3678ed16659eb87c151ca92a1180aa"
  end
  version "2336.0.0"
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
