require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5764.0.0-darwin-x64.tar.gz"
    sha256 "a6d8a0cbc1ccd6551e959c7d76bae34ca060292a49232454764bcde631d19368"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5764.0.0-darwin-arm64.tar.gz"
      sha256 "5e48d59a3d9b0f068aec14b8e02f9d0e68e0db1b9138b723035519c36deb27e4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5764.0.0-linux-x64.tar.gz"
    sha256 "d8514ebbdc420c36bc88c61487d921adb359dc83a860f1abe10ca5d365601dda"
  end
  version "5764.0.0"
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
