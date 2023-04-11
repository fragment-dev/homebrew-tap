require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2404.0.0-darwin-x64.tar.gz"
    sha256 "b77dba87577450b4b41e64669476ab1705f313a77899cddb67d9645659d976fb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2404.0.0-darwin-arm64.tar.gz"
      sha256 "fc03a985943ddb172f4c7d4c3e0f1cda926cfd575cd944df5650461b4de1ba47"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2404.0.0-linux-x64.tar.gz"
    sha256 "2eb2003ee2618065ecb42393cf5336d3064bb8ecf3172c455aefbed889247a82"
  end
  version "2404.0.0"
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
