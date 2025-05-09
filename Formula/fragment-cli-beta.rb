require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6593.0.0-darwin-x64.tar.gz"
    sha256 "0a5990e07eb73f4054a4d779fb505eb1db2fba0ddcdce831e6c2b6680a036b81"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6593.0.0-darwin-arm64.tar.gz"
      sha256 "69dbcdd438a8e268343e62a04f99a3ee93445626670356d40a38d4f7be4cddae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6593.0.0-linux-x64.tar.gz"
    sha256 "f40849b5ff036be378f83d3ef29f03d72d1826bf731c0122b3277eb520945589"
  end
  version "6593.0.0"
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
