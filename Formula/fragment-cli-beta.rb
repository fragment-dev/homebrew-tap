require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3982.0.0-darwin-x64.tar.gz"
    sha256 "817f70c346acbc97e213f93f7a6b67f6e2638434022f76b1f417bc1ce35fc75d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3982.0.0-darwin-arm64.tar.gz"
      sha256 "bc6cc64029a01805032c459c335ce61c8c9e3f4fdbf37dbf08228753000cb3b4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3982.0.0-linux-x64.tar.gz"
    sha256 "a7d920f8302da80363419f2344609b9feb95fe2665cbecdf1fcd2f5798a04a7a"
  end
  version "3982.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
