require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3258.0.0-darwin-x64.tar.gz"
    sha256 "809f42525a2a57bde829431466e49ef9058b25390bc4ac3ac1b2deffe55479a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3258.0.0-darwin-arm64.tar.gz"
      sha256 "980c4262dc5c47225a06e64cc72f4f0c2a8f1bbac00e14add115dd4f10691ace"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3258.0.0-linux-x64.tar.gz"
    sha256 "b9db06d0a7677a61e651b90e11c3e3fcf43ab4a5ce2f59ea0d072b479460ddf5"
  end
  version "3258.0.0"
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
