require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5360.0.0-darwin-x64.tar.gz"
    sha256 "6c54120933b844077e78a85f57b9d52373cbb73e437b8c75fa3655751a88651c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5360.0.0-darwin-arm64.tar.gz"
      sha256 "512426f8c0c705cb565cc65d1c281e8d2fae68400dbda4a4cdf5d11034c2d4ef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5360.0.0-linux-x64.tar.gz"
    sha256 "17a4aa344ea4d32b52f886a0a372b387a076dffd2509ba960aa3a3631ecb0322"
  end
  version "5360.0.0"
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
