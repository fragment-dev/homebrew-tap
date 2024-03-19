require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4782.0.0-darwin-x64.tar.gz"
    sha256 "2e153159401374c72141fc313ea2319351a69365723e7fa60007417780520164"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4782.0.0-darwin-arm64.tar.gz"
      sha256 "51c1630966baa5d6ebcd1a01be455c67d330e636e46f0ada52c1d720bdd2f896"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4782.0.0-linux-x64.tar.gz"
    sha256 "15b5d0d7b12208ceb70b5fcb0d1d4954ec95e3aa6bedabcf44efd2a9623c1a23"
  end
  version "4782.0.0"
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
