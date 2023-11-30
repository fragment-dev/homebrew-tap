require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4074.0.0-darwin-x64.tar.gz"
    sha256 "07aab42c0bdf4f48753c6a671c6e9feddb2f94dad66faf140bf13903cc591f4d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4074.0.0-darwin-arm64.tar.gz"
      sha256 "c3478b369619162d359b7dedfc21c62dc519ec10dfae351fe51a572d9853e7e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4074.0.0-linux-x64.tar.gz"
    sha256 "5e54097475982ad80c45dc378bff2530e1cb33c3cc2fd477722a04ab285cc0d2"
  end
  version "4074.0.0"
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
