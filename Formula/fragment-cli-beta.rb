require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2433.0.0-darwin-x64.tar.gz"
    sha256 "5dc707b765fd7c455b24a7eaccca1e150098f7b69df3a399698c4bd5a4d4982e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2433.0.0-darwin-arm64.tar.gz"
      sha256 "aa109fed9e0f7cb89f0cd82cbf4970a25a50821a652ee711a5544f6e9958c3e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2433.0.0-linux-x64.tar.gz"
    sha256 "3fa720e2a3066e6a641dcac60eadef48a5d052a2348831c5841c449d2f1de90c"
  end
  version "2433.0.0"
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
