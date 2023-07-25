require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3155.0.0-darwin-x64.tar.gz"
    sha256 "2f1f57ba2e39d7bd3d083a70ce400546590ba835bef1bf975c17ac27506f5e30"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3155.0.0-darwin-arm64.tar.gz"
      sha256 "491abb08322853ae0de9fe7f0a79cd59295b363b6ee42f2e7730669283081bd5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3155.0.0-linux-x64.tar.gz"
    sha256 "98c89ec1b561372c5c0b30925d77735996b17b6497d92cb0f1c1b3ec9d5b234e"
  end
  version "3155.0.0"
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
