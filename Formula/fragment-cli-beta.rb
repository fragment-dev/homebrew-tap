require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4935.0.0-darwin-x64.tar.gz"
    sha256 "be5701c8d92f970cbb899f6bb1fb29e924aec09d085c2949db48510049e8d099"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4935.0.0-darwin-arm64.tar.gz"
      sha256 "43719d4f08a28b930d1e4f27dde8c66d2986e2511129b3229a795f56f81a5d21"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4935.0.0-linux-x64.tar.gz"
    sha256 "e5ea5c96ae87ef6d16f5dd0c593359241c673860cec2dd8eac8159d41a3ce186"
  end
  version "4935.0.0"
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
