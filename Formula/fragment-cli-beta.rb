require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2600.0.0-darwin-x64.tar.gz"
    sha256 "9af1e44b359b534dcacb05dd22da370192022dd31ba775c9dcb29512be635b65"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2600.0.0-darwin-arm64.tar.gz"
      sha256 "b86880f60d73dab7e14f7ac7f78f18bbb01cdd244d97103e6ff44db65625d868"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2600.0.0-linux-x64.tar.gz"
    sha256 "f21ea6ca976a3eed6fc627359f32d4c29b9537a2955500b8628c7245de89c1d0"
  end
  version "2600.0.0"
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
