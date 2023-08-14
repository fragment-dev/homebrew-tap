require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3299.0.0-darwin-x64.tar.gz"
    sha256 "8a027b55d026e284a66e1e1e0797842d95de4475411be1e88f3638c8b54b5399"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3299.0.0-darwin-arm64.tar.gz"
      sha256 "8ddd86dacb12a20ec5d244bedcc2fdf9e15e07da8783f72b66eecc21a0ac5a73"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3299.0.0-linux-x64.tar.gz"
    sha256 "eba984cca180e538f79cb45ef5f2cbcfbab13a11772c585ea616574ec9f7e948"
  end
  version "3299.0.0"
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
