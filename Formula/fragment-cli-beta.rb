require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2601.0.0-darwin-x64.tar.gz"
    sha256 "75fd3803255294a3db59f6cfce567910c0385925d68e0cd741d1e08a532989e3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2601.0.0-darwin-arm64.tar.gz"
      sha256 "ed6949166b9ecf60639643cd6d00ec7c676958d130aec0ba964ac6979ad1038a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2601.0.0-linux-x64.tar.gz"
    sha256 "39c570262a85c636fd9720e5e977caecfd48b68edc2d1659ae2794f6b5e1ff81"
  end
  version "2601.0.0"
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
