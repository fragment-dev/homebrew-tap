require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5511.0.0-darwin-x64.tar.gz"
    sha256 "b989ea7796f1431c2550ed72ccc8283ca784d984a09ff997dc37b8ce485b973d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5511.0.0-darwin-arm64.tar.gz"
      sha256 "9767ada4e13ee033c714b55bd0d4928278b6b6ce872c808767e491c2b56e166c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5511.0.0-linux-x64.tar.gz"
    sha256 "adcbacc5103b98dbdaee1d3fb638df8aae79f00d5ecaf86ca6d1524b3bf98db7"
  end
  version "5511.0.0"
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
