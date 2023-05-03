require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2571.0.0-darwin-x64.tar.gz"
    sha256 "879e23dd01fa77fad4310e7e210a658b392604594abf3337a9b8aa8cf753e0d4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2571.0.0-darwin-arm64.tar.gz"
      sha256 "341bdbbc7db50eb9908a341fd5d2313d7998c5c85547e450443562f52ccb2c74"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2571.0.0-linux-x64.tar.gz"
    sha256 "cc04a6c022d5945d539e4dc76bc486961c3486dee2c4d9fa3bfb7c3ec95b7424"
  end
  version "2571.0.0"
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
