require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2753.0.0-darwin-x64.tar.gz"
    sha256 "0b64539e43605c27fe0135313b6431a9b6b589286fe2b5e97ba6227c57898024"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2753.0.0-darwin-arm64.tar.gz"
      sha256 "7a5c54aec539adbb788d35af9e1aee0cf7b21e48f7cb118cd9d1da8102b65c76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2753.0.0-linux-x64.tar.gz"
    sha256 "7583f371b967721eae7a730515278efc9562ed5278cb7b23e7571081b163f9a8"
  end
  version "2753.0.0"
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
