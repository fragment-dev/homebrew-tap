require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2973.0.0-darwin-x64.tar.gz"
    sha256 "f9bbc4d9ecc22f54952a221707759a712093362050a1c608b3b6840f0181e262"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2973.0.0-darwin-arm64.tar.gz"
      sha256 "e777d36d5a16b291d699ab014a2b40313a85c891be703f4dc98ad485cf0ad4ba"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2973.0.0-linux-x64.tar.gz"
    sha256 "2f0a52461fbe92ae3aa4e3b25308d76494dc7fd3c2b9737f7f94e78a6568fb2b"
  end
  version "2973.0.0"
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
