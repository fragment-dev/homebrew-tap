require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4007.0.0-darwin-x64.tar.gz"
    sha256 "1bca81b8e971d8d3a1f7a1dc4aef6a8c847cdf8443f3bc9257b26b5c544e6754"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4007.0.0-darwin-arm64.tar.gz"
      sha256 "c0c9da459baf4556c899779a7e4e0fb7df1ea326bf0fb4cd9581080ac7374ed7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4007.0.0-linux-x64.tar.gz"
    sha256 "f03bdf3cc0393c18d5283969891cd4abe73a44e605053c1a4f32d076b02e416c"
  end
  version "4007.0.0"
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
