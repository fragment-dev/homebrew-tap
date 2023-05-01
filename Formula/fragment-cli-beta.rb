require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2558.0.0-darwin-x64.tar.gz"
    sha256 "a4483a41ec3c345bc9dc22b2274dc986b3bf969525c3ce7bce9d5b940f05f29d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2558.0.0-darwin-arm64.tar.gz"
      sha256 "606a1ec653e99cd31581f66e79816023874dc86ac35b19f536cd1c5d8a46036e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2558.0.0-linux-x64.tar.gz"
    sha256 "7347611c2eca371559037a46df1f8cc5446b01ad980cf4b2e60620d6f0339b25"
  end
  version "2558.0.0"
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
