require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5834.0.0-darwin-x64.tar.gz"
    sha256 "f8fb4cbc8d901209d7b6c646ac221fcfc6aa126a58ea9b6d88c6ab134ec64d11"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5834.0.0-darwin-arm64.tar.gz"
      sha256 "2444b7891a56e7e4728882ce8462a831608feab6e1dfdc30ec7ead6f8af40052"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5834.0.0-linux-x64.tar.gz"
    sha256 "ad8906fa14078ebe9b9aebcd906b9e9143686ad0106dceff0ba106ce2f6d9781"
  end
  version "5834.0.0"
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
