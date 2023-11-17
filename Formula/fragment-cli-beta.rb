require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4026.0.0-darwin-x64.tar.gz"
    sha256 "b5f9c93dca63d05179c4a0a97a4bc4535235ad929cfbf8358d4164bcfabbac5e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4026.0.0-darwin-arm64.tar.gz"
      sha256 "0034a87a1b4ce180b1ac4b77b2b912f129df02a5b119289cd3d659222907b273"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4026.0.0-linux-x64.tar.gz"
    sha256 "3863d5e3083b3b455fd1254e50890315c63efac6a70828cc8ddf0783f079f298"
  end
  version "4026.0.0"
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
