require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2746.0.0-darwin-x64.tar.gz"
    sha256 "2eaaa3682e62d5240df75c8087a8e032b51eb5ac09660a23a65cfd43c236c19d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2746.0.0-darwin-arm64.tar.gz"
      sha256 "01da697849ace230c15710cddc75de53f47750eba252a2d49ff851d6e4b9aef0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2746.0.0-linux-x64.tar.gz"
    sha256 "dc9335640cb29eb4bf2b602b266f64cbae0a4f7943b7b24ce955f8a4f553f421"
  end
  version "2746.0.0"
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
