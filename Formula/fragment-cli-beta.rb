require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5993.0.0-darwin-x64.tar.gz"
    sha256 "12a4d21c58eae5ac75998db46bf2dff17226ca472e43edbc19f7229111c8dca0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5993.0.0-darwin-arm64.tar.gz"
      sha256 "a13427f38da1b3e51c95b1ed8df9e1bfd68999e6ff50b379fc9142f7a66ab575"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5993.0.0-linux-x64.tar.gz"
    sha256 "494200ed5ffbd558b44e10380856dfb373cd35a00d4afc5f51233c858dcf91fb"
  end
  version "5993.0.0"
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
