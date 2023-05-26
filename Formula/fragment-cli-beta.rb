require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2750.0.0-darwin-x64.tar.gz"
    sha256 "068f440e363a7b634d68ff80cb060d623d33c54def9404c98d53d59074f4fe36"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2750.0.0-darwin-arm64.tar.gz"
      sha256 "a242ddfa9e7b20778022e44e4b63fc661238ebb9e356030b021d92c706b12af1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2750.0.0-linux-x64.tar.gz"
    sha256 "28741e3eddb1348af6081d571cd8ce4720a9cdf7daa45955f5f4f5e6a03bf331"
  end
  version "2750.0.0"
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
