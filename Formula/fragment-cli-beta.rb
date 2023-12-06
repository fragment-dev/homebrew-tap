require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4108.0.0-darwin-x64.tar.gz"
    sha256 "58eabfca8d0e323f91061280348127edb3d490185290489bc053851bedc58f5e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4108.0.0-darwin-arm64.tar.gz"
      sha256 "dc209b7228524f0e3ec528ed7b5a14970956845a43e52f748dc18ce5434fb424"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4108.0.0-linux-x64.tar.gz"
    sha256 "416796e9b1f430728e181aa592b8e95bebbbc9b3e442bf49dfb6a0f0cef291cc"
  end
  version "4108.0.0"
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
