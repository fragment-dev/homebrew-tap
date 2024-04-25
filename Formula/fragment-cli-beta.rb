require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4944.0.0-darwin-x64.tar.gz"
    sha256 "fffbc84d41f8bd8eb8715a70464d72414b52e314e79b79e031fc39fdcbbdb21c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4944.0.0-darwin-arm64.tar.gz"
      sha256 "697ef8bdfa01da4056cf4c248d5b798168e2efd24fe4e446d0ee0e25c89b997a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4944.0.0-linux-x64.tar.gz"
    sha256 "d31eeecf29bc7e05dd39db368543e4430b3d17000b4c58f5736f81660a2a909d"
  end
  version "4944.0.0"
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
