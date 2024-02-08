require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4523.0.0-darwin-x64.tar.gz"
    sha256 "38b5df0ae92f080214eed73c5dabb301a3643ee33efd25ed212adc2c74abfe34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4523.0.0-darwin-arm64.tar.gz"
      sha256 "28be74c42fcfa54ca135ea7ccd4f9bbd15634af2efe79b98e7f6fea5f5955d76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4523.0.0-linux-x64.tar.gz"
    sha256 "88cea714749a3f9d221204ba2990136889f0680b3ddaa083bdfe2c3ef3bb96df"
  end
  version "4523.0.0"
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
