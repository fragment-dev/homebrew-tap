require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2307.0.0-darwin-x64.tar.gz"
    sha256 "80796bc0e101a77d302d4604dc5e90863050437e1ada8920c8d644b7ee8b0f98"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2307.0.0-darwin-arm64.tar.gz"
      sha256 "9a64ce8b569ea1012461b2b69a55614a6cf1dbf237f54c3094b7ed86f16f02ec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2307.0.0-linux-x64.tar.gz"
    sha256 "3249c6943d15c123e3f5e749fcdb39c508c13ce5b42fb4f32cac93b73ab7d381"
  end
  version "2307.0.0"
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
