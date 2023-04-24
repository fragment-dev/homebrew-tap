require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2512.0.0-darwin-x64.tar.gz"
    sha256 "df919a86afa938561b6a9669e68fcf95281ce20087b6699ef0f06bcca905246f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2512.0.0-darwin-arm64.tar.gz"
      sha256 "b18b87d0351241c570fc9a089a5b90c56e9fa1c647275e4a2fc388e1084a4a47"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2512.0.0-linux-x64.tar.gz"
    sha256 "82f60904d779adb8c6ffc5cc9f6d41cc1d04a589ed46203fc324f080f57ae982"
  end
  version "2512.0.0"
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
