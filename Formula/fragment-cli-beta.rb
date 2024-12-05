require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5850.0.0-darwin-x64.tar.gz"
    sha256 "cb76b15bfd439ef1ca2ad149857fd636a4db3f5a2fe531c290ff663fe9ab8350"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5850.0.0-darwin-arm64.tar.gz"
      sha256 "1152aecaa083a780d1fa2e8aa750c1065629d2632f9a3c17a7b5e74143fa5754"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5850.0.0-linux-x64.tar.gz"
    sha256 "75fbd5702c3bfce28794dbce2f871da7193377caa4d6b1f3af321c642998b48d"
  end
  version "5850.0.0"
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
