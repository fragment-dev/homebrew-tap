require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4652.0.0-darwin-x64.tar.gz"
    sha256 "6213c3860cdc8a1d7ee4fd248d8123cdaa9b585c6f894d2259e30750da4b20b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4652.0.0-darwin-arm64.tar.gz"
      sha256 "ea6e516971396f83eab075c4f5ea6e3153edc527193c92ccc2806141f8ba1cc3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4652.0.0-linux-x64.tar.gz"
    sha256 "bf082b963bcd52cf322c6b2052cff99fa9ea5ceba09824deedeec11b2266dab1"
  end
  version "4652.0.0"
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
