require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5130.0.0-darwin-x64.tar.gz"
    sha256 "bc1a5208d9e5a846c2c2c540406d6d4bb7f88838512357a72cf5974b0a5e4651"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5130.0.0-darwin-arm64.tar.gz"
      sha256 "4168c4de366363793379362a334e7d326b31923e197ac07152684d44aca514f3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5130.0.0-linux-x64.tar.gz"
    sha256 "21aa782a1196440cda7c9a31536e6965edc6c5c38760f2d6c9da90c3fba6ceac"
  end
  version "5130.0.0"
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
