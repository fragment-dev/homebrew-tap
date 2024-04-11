require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4877.0.0-darwin-x64.tar.gz"
    sha256 "b689d7477dc6ea192b90a5fcf97e0831bc4b022c8115e064b9291f2708230240"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4877.0.0-darwin-arm64.tar.gz"
      sha256 "f8d91f79d8b9540739abc0b8080e4e15c21837a0426100185e9232319242e365"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4877.0.0-linux-x64.tar.gz"
    sha256 "e15c44097c3bdc54bd4e38092a7d75f882cbbef310001f798e764f0ec60fe181"
  end
  version "4877.0.0"
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
