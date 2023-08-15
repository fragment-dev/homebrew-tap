require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3331.0.0-darwin-x64.tar.gz"
    sha256 "9db0b6ff715dbfd362fb9b7da7d8d151b9736d1e282e2a3ef745510343c35734"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3331.0.0-darwin-arm64.tar.gz"
      sha256 "8ae4f9ca68894504bc898c70632e50abd35e1fa466a58d9f4a78ea0fed21ce36"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3331.0.0-linux-x64.tar.gz"
    sha256 "49847e35165d0bff101b909ce80b3091e36bde005f3e18787b7a54abeb70a357"
  end
  version "3331.0.0"
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
