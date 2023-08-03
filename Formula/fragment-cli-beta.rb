require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3228.0.0-darwin-x64.tar.gz"
    sha256 "e200e6c0d5f34b846cdead63553dc8a12bef8d7e8387726f3a87541427c7ac63"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3228.0.0-darwin-arm64.tar.gz"
      sha256 "5b41769d48e72d5b015babd3030eedd6c75013491402046752fdb0d447eaa621"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3228.0.0-linux-x64.tar.gz"
    sha256 "4ca9b3a59f5998767608cd751b94b00b51d82c77302dcd713cd78da8e22dfc5f"
  end
  version "3228.0.0"
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
