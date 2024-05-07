require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5006.0.0-darwin-x64.tar.gz"
    sha256 "4928c841a42e12bc6b9a84e8fd32f1fffe0d8bf3093c8d156e67321ea4e2fcea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5006.0.0-darwin-arm64.tar.gz"
      sha256 "269ae486ff57558614f04669b60abca4b9741320857ee7c2d7fc51bb38210e1f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5006.0.0-linux-x64.tar.gz"
    sha256 "1a057cefec0fdd0f9793602672fecc7db889f25074aacd01c02dc8f36dc98abe"
  end
  version "5006.0.0"
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
